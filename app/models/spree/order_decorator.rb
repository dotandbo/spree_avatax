require 'digest'

Spree::Order.class_eval do

  ##
  # Possible order states
  # http://guides.spreecommerce.com/user/order_states.html

  # Send Avatax the invoice after ther order is complete and ask them to store it
  Spree::Order.state_machine.after_transition :to => :complete, :do => :commit_avatax_invoice

  # Start calculating tax as soon as addresses are supplied
  Spree::Order.state_machine.after_transition :from => :address, :do => :avatax_compute_tax

  # Calculate tax for shipping
  Spree::Order.state_machine.after_transition :from => :delivery, :do => :avatax_compute_tax

  def avataxable?
    line_items.present? && ship_address.present?
  end

  def promotion_adjustment_total
    adjustments.promotion.eligible.sum(:amount).abs
  end

  ##
  # This method sends an invoice to Avalara which is stored in their system.
  def commit_avatax_invoice
    SpreeAvatax::TaxComputer.new(self, { doc_type: 'SalesInvoice', status_field: :avatax_invoice_at, logger: Rails.logger }).compute
  end

  ##
  # Comute avatax but do not commit it their db
  def avatax_compute_tax
    # Do not calculate if the current cart fingerprint is the same what we have before.
    # Alleviate multiple API calls for the same tax amount.
    return if avatax_fingerprint == calculate_avatax_fingerprint

    SpreeAvatax::TaxComputer.new(self, { logger: Rails.logger}).compute
    update_attributes!(avatax_fingerprint: calculate_avatax_fingerprint)
  end

  # The fingerprint hash is the # of line items, # of shipments, and order total, and the ship address entity and last update
  def calculate_avatax_fingerprint
    md5 = Digest::MD5.new
    md5.update "#{self.total}#{self.line_items.count}#{self.shipments.count}#{self.ship_address.id}#{self.ship_address.updated_at}"
    md5.hexdigest
  end
end

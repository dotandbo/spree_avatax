# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_avatax'
  s.version     = '2.3.0'
  s.summary     = 'Avatax extension for Spree 2.3.x'
  s.description = "Spree 2.2.x extension to retrieve tax rates via Avalara's REST API."
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'HoyaBoya'
  s.email     = 'you@example.com'
  s.homepage  = 'http://www.spreecommerce.com'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core',  '~> 2.3.1'
  # The 0.0.4 version can be found here:
  # https://github.com/HoyaBoya/avalara.git
  s.add_dependency 'avalara',     '~> 0.0.4'
  s.add_dependency 'hashie',      '~> 3.2.0'
  s.add_dependency 'multi_json'

  s.add_development_dependency 'rails',   '~> 4.1.2'

  # Required to test Honeybadger alerting
  s.add_development_dependency 'honeybadger'

  # Required to test Pagerduty alerting
  s.add_development_dependency 'pagerduty'

  s.add_development_dependency 'capybara',        '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl',    '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',     '~> 2.13'
  s.add_development_dependency 'rspec-its'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end

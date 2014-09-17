source 'https://rubygems.org'

group :test, :development do
  gem 'vcr'
  gem 'webmock'
  gem 'pry'
  gem 'timecop'
  gem 'avalara', git: 'https://github.com/HoyaBoya/avalara.git', branch: '0.0.4-dev'

  platforms :ruby_19 do
    gem 'pry-debugger'
  end

  platforms :ruby_20, :ruby_21 do
    gem 'pry-byebug'
  end
end

gemspec

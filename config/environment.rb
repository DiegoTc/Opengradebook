require File.join(File.dirname(__FILE__), 'boot')

require 'csv'

RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.gem 'declarative_authorization', :source => 'http://gemcutter.org'

  config.load_once_paths += %W( #{RAILS_ROOT}/lib )
  config.load_paths += Dir["#{RAILS_ROOT}/app/models/*"].find_all { |f| File.stat(f).directory? }

  config.reload_plugins = true if RAILS_ENV == 'development'
  config.plugins = [:paperclip,:all]

end

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_charset = "utf-8"

ActionMailer::Base.smtp_settings = {
   :enable_starttls_auto => true,
   :address => "smtpout.secureserver.net",
   :port => 80,
   :domain => "inedhn.com",
   :user_name => "inedsps@inedhn.com",
   :password => "inedsps123",
   :authentication => :plain
}

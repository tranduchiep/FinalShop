# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :domain => 'fasonla.com',
  :user_name => 'dap703',
  :password => '1tranduchiep',
  :authentication => 'plain',
}
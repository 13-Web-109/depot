# Load the rails application
require File.expand_path('../application', __FILE__)
# Initialize the rails application
Depot::Application.initialize!


Depot::Application.configure do
   config.action_mailer.delivery_method = :smtp	
   config.action_mailer.raise_delivery_errors = true	

   config.action_mailer.smtp_settings = {
   	address:  "smtp.163.com",
   	port:      25,
    authentication: "plain",
    user_name:  "depot_of_bluekey",
    password:   "bluekey",
  }
end
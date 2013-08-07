ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_as_admin
     session[:user_id] = users(:admin).id
     session[:user_type] = users(:admin).user_type
  end
  def login_as_user
     session[:user_id] = users(:user).id
     session[:user_type] = users(:user).user_type
  end

  def logout
    session.delete :user_id
    session.delete :user_type
  end

  def setup
  	login_as_user if defined? session
  end
end

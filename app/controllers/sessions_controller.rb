class SessionsController < ApplicationController
  skip_before_filter :loggedIn
  skip_before_filter :admin
  
  def new

  end

  def create
  	user = User.find_by_name(params[:name])
  	if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_type] = user.user_type
  		redirect_to store_url, notice: "Logged in"
  	else
  		redirect_to login_url, alert: "Invalid user/password combination"
  	end
  end

  def destroy
    session[:user_id] = nil
    session[:user_type] = nil
  	redirect_to store_url, notice: "Logged out"
  end
end

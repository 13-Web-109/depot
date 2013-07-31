class ApplicationController < ActionController::Base
  before_filter :loggedIn
  before_filter :admin
  before_filter :set_i18n_locale_from_params
  protect_from_forgery

  private
    def current_cart
      cart = Cart.find_by_user_id(session[:user_id])
      unless cart
        cart = Cart.create(:user_id => session[:user_id])     
      end
      cart 
    end

  protected
  	def loggedIn
  		# unless User.find_by_id(session[:user_id])
  		# 	redirect_to login_url, notice: "Please log in"
  		# end
      unless session[:user_id] 
        respond_to do |format|
          format.html { redirect_to login_url, notice: "Please log in" }
          format.js { render "layouts/redirect.js.html"}
        end
      end
  	end

    def admin
      unless session[:user_id] && session[:user_type] == 0
        redirect_to login_url, notice: "Please log in as admin"
      end
    end

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] =
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { locale: I18n.locale }
    end
end

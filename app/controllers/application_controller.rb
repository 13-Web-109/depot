class ApplicationController < ActionController::Base
  before_filter :loggedIn
  before_filter :admin
  before_filter :set_i18n_locale_from_params
  protect_from_forgery

  private
    def current_cart
      Cart.find(session[:cart_id])
    rescue
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

  protected
  	def loggedIn
  		# unless User.find_by_id(session[:user_id])
  		# 	redirect_to login_url, notice: "Please log in"
  		# end
      respond_to do |format|
      unless User.find_by_id(session[:user_id])
        format.html { redirect_to login_url, notice: "Please log in" }
        format.js { render "login"}
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  	end

    def admin
      unless User.find_by_id(session[:user_id]) && User.find(session[:user_id]).name == "bluekey"
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

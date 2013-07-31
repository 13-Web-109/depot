class StoreController < ApplicationController
  skip_before_filter :loggedIn
  skip_before_filter :admin

  def index
  	if params[:set_locale]
  		redirect_to store_path(locale: params[:set_locale])

  	else
      if params[:search]
        @products = Product.find(:all, :conditions=>["title like ?","%#{params[:search]}%"])
      else
  	    @products = Product.order(:title)
  	  end

      @cart = current_cart
    end
  end
end
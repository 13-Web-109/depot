class StoreController < ApplicationController
  skip_before_filter :loggedIn
  skip_before_filter :admin

  def index
  	if params[:set_locale]
  		redirect_to store_path(locale: params[:set_locale])

  	else
      if params[:search]
        @products = Product.where("title like ?","%#{params[:search]}%").paginate page: params[:page], order:'title', per_page:10
        @tatol = Product.where("title like ?","%#{params[:search]}%").count
      else
        @products = Product.paginate page: params[:page], order:'title', per_page:10
  	  end

      @cart = current_cart
    end
    @categories = Category.all 
  end
end
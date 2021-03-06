class ProductsController < ApplicationController
  skip_before_filter :admin, only: [:show]
  skip_before_filter :loggedIn, only: [:show]

  # GET /products
  # GET /products.json

  def index
    @products = Product.paginate page: params[:page], order:'updated_at', per_page:10
    @categories = Category.all
    @subcategories = Subcategory.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @categories = Category.all 
    @subcategories = Subcategory.all 
    
    @cart = current_cart
    @comments = Comment.where(product_id: @product.id)
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @categories = Category.all
    @subcategories = Subcategory.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
    @subcategories = Subcategory.all
  end

  # POST /products
  # POST /products.json
  def create
    @image = params[:product][:image_url]
    params[:product][:image_url] = params[:product][:image_url].original_filename
    @product = Product.new(params[:product])
    # @product.image_url = params[:product][:image_url].original_filename
    @categories = Category.all
    @subcategories = Subcategory.all
    @product.subcategory_id = params[:subcategories]
    respond_to do |format|
      if @product.save
        uploadFile(@image)
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @image = params[:product][:image_url]
    params[:product][:image_url] = params[:product][:image_url].original_filename

    @product = Product.find(params[:id])
    @categories = Category.all
    @subcategories = Subcategory.all
    respond_to do |format|
      if @product.update_attributes(params[:product])
        uploadFile(@image)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    @categories = Category.all
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def who_bought
    @product = Product.find(params[:id])
    @categories = Category.all
    respond_to do |format|
      format.atom
    end
  end
end

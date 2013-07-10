require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  #fixtures :products  #add product.yaml data to the database

  test "product attribute must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?    
    assert product.errors[:image_url].any?
    assert true
  end

  test "product price must be positive" do 
    product = Product.new(title: "newBook", description: "this is desc.", image_url:"newBook.jpg")
    product.price = -1
    assert product.invalid?
    
    product.price = 0
    assert product.invalid?

    product.price = 1
    assert product.valid?
  end

  test "image url must be valid" do
    product = Product.new(title: "newBook", description: "this is desc.", price:1)

    product.image_url = "bad.psd"
    assert product.invalid?

    product.image_url = "good.jpg"
    assert product.valid?
  end

  test "title must be unique" do
    product = Product.new(title: products(:ruby).title, description:"this is desc", image_url:"ruby.jpg", price: 12.0)
    assert product.invalid?
    assert product.errors[:title].any?
  end


end

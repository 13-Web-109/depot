class Product < ActiveRecord::Base
  has_many  :line_items
  has_many :orders, through: :line_items
  has_many :comments
  belongs_to :subcategory 
  before_destroy :ensure_not_referenced_by_any_line_item
 
  validates :description, :image_url, :price, :title, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: {
    with:%r{\.(png|jpg|jpeg|gif)$}i, 
    message:"must be a URL for GIF, JPG, JPEG or PNG image."
  }
  validates :title, :uniqueness => true

  attr_accessible :description, :image_url, :price, :title,:price_confirmation,:subcategory_id

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end

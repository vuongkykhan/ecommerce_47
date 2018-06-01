class Product < ApplicationRecord
  attr_accessor :quantity_in_cart
  belongs_to :category
  has_many :order_details
  has_many :reviews
  validates :name, presence: true, length: {maximum: Settings.product_name.length}
  validates :price, :quantity, :image, presence: true
  scope :load_product, ->{where "quantity > ?",  Settings.quantity.zero}
  scope :load_product_by_ids, ->product_ids{where id: product_ids}
  scope :find_by_name, ->name{where("name like ?", "%#{name}%") if name.present?}
  scope :order_by_id, ->{order id: :desc}
end

class Product < ApplicationRecord
  attr_accessor :quantity_in_cart
  belongs_to :category
  has_many :order_details
  has_many :reviews
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: {maximum: Settings.product_name.length}
  validates :description, presence: true, length: {maximum: Settings.product_description.length}
  validates :price, :quantity, presence: true
  validates :image, presence: true, allow_nil: true
  validate :image_size
  scope :load_product, ->{where "quantity > ?",  Settings.quantity.zero}
  scope :load_product_by_ids, ->product_ids{where id: product_ids}
  scope :find_by_name, ->name{where("name like ?", "%#{name}%") if name.present?}
  scope :order_by_id, ->{order id: :desc}
  scope :load_product_by_category, ->category_id{where("category_id = ?", category_id)}

  private

  def image_size
    return unless image.size > Settings.product.image.size.megabytes
    errors.add(:image, I18n.t("less_than_2mb"))
  end
end

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  validates :customer_name, presence: true, length: {maximum: Settings.name.length}
  validates :customer_phone, :customer_address, :customer_city, :customer_country,  presence: true
  scope :newest, ->{order(created_at: :desc)}
  scope :by_product_id, ->(product_id) do
    joins(:order_items)
    .where("order_items.product_id = ?", product_id)
    .where("status = ?", Order.statuses[:in_progress])
  end
  enum status: [:cancelled, :in_progress, :rejected, :approved]
end

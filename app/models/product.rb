class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :reviews
  # mount_uploader :image, PictureUploader
end

class Product < ActiveRecord::Base

  monetize :price_cents
  mount_uploader :image, ProductImageUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true


end

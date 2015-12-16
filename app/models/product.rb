class Product < ActiveRecord::Base

  monetize :price_cents, allow_nil: false, numericality: {
               greater_than_or_equal_to: 0
           }
  mount_uploader :image, ProductImageUploader

  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 100 }
  validates :price_cents, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true

end

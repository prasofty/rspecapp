class Product < ActiveRecord::Base

  monetize :price_cents
  mount_uploader :image, ProductImageUploader
end

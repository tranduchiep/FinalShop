class Wishlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  
  def self.CheckProductWishlist(user, product)
    where(user_id: user, product_id: product)
  end
end

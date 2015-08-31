class Product < ActiveRecord::Base
  belongs_to :category
  has_many :likes
  has_many :wishlists
  has_many :carts
  has_many :ratings
  has_many :views
  has_attached_file :image, styles: {small: "100x100!", medium: "300x150!", large: "400x400!"},
                      :default_url => "/images/:style/missing.png"
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  def self.search(key)
    key = key.split
    str = key.collect{|c| "%#{c}%"}
    product_arel = Product.arel_table
    where(product_arel[:slug].matches_any(str))
  end

end

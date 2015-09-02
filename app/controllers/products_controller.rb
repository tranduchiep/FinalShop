class ProductsController < ApplicationController
  impressionist :actions=>[:show]
  def show
    @product = Product.find(params[:id])
    @wishlist = Wishlist.where(user_id: current_user)
    @comments = Comment.where(product_id: params[:id])
    @rate = Comment.where(product_id: params[:id]).average(:rate).to_f
    @like = Like.where(product_id: params[:id], value: true).count
    @unlike = Like.where(product_id: params[:id], value: false).count
    if user_signed_in?
      @checkproductwishlist = Wishlist.CheckProductWishlist(current_user.id, params[:id])
    end

  end
end
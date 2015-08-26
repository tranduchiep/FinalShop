class WishlistsController < ApplicationController
  def index
    @wishlists = Wishlist.where(user_id: current_user.id)
  end

  def show
    @wishlist = Wishlist.where(user_id: 24).map{|p| p.product_id}
    @products = Product.where(id: @wishlist).page(params[:page])
  end

  def add_product
    if Wishlist.create!(user_id: current_user.id, product_id: params[:wishlists][:product_id],
    name: params[:wishlists][:name]).valid?
      flash[:success] = "Add product to wishlist complete."
      redirect_to :back
    else
      flash[:error] = "Add product to wishlist fail."
      redirect_to :back
    end
  end

  def remove_product
    user_id = params[:user_id].to_i
    product_id = params[:product_id].to_i
    @data = Wishlist.find_by_user_id_and_product_id(user_id, product_id).delete
    respond_to do |format|
      format.html {}
      format.json {render :json => @data}
    end
  end
end

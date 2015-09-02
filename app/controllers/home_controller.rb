class HomeController < ApplicationController
 
  def index
    @products = Product.order(:category_id).page(params[:page])
    @categories = Category.all
  end

  def active
    if User.verify_key(params[:key])
      flash[:success] = "Account active complete."
      redirect_to active_complete_home_path
    else
      flash[:error] = "Account cannot active."
      redirect_to active_home_path
    end
  end

  def search
    products = Product.search(params[:key]) if params[:key].present?
    if products
      cate_id = products.map{|c| c.category_id}.uniq
      @category = Category.where(id: [cate_id])
      @min = products.map{|p| p.price}.min
      @max = products.map{|p| p.price}.max
    end
    
    products = products.where(category_id: params[:category].to_i) if params[:category].present?
    products = products.where("price BETWEEN #{params[:price].partition(',').first.to_i} AND #{params[:price].partition(',').last.to_i}") if params[:price].present?
    @products = products.page(params[:page])
    
  end
end

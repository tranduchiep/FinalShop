module Admin
  class OrdersController < AdminController
    def index
      @orders = Order.order(:created_at).page(params[:page])
    end

    def update
      if Order.find(params[:id]).update(status: params[:orders][:status])
        flash[:success] = "Update status conplete"
        redirect_to :back
      else
        flash[:error] = "Update status fail !!!"
        redirect_to :back
      end
    end

    def destroy
      Order.find(params[:id]).destroy
      flash[:success] = "Delete Order complete."
      redirect_to admin_orders_path
    end
  end
end
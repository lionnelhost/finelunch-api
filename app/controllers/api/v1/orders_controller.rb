module Api
    module V1
        class OrdersController < ApplicationController
            before_action :set_order, only: [:show]
            def index 
                @orders = Order.all

                render json: @orders.to_json(:include => {
                    :user => {:only => [:email]},
                    :menu_item => {
                        :include => [:dish],
                        :except => [:created_at, :updated_at]
                    }
                  }, :except => [:updated_at])
            end

            def show
                render json: @order.to_json(:include => {
                    :user => {:only => [:email]},
                    :menu_item => {
                        :include => [:dish],
                        :except => [:created_at, :updated_at]
                    }
                  }, :except => [:updated_at])
            end

            private 
            
            def set_order
                @order = Order.find(params[:id])
            end

            def order_params
                params.require(:order).permit(:user_id, :menu_item_id, :status)
            end
        end
    end
end
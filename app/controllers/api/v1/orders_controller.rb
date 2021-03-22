module Api
    module V1
        class OrdersController < ApplicationController
            before_action :set_order, only: [:show]
            def index 
                @orders = Order.includes(:user, menu_item: [dish: [:dish_type]]).page(@page).per(@per_page)

                render json: @orders.to_json(:include => {
                    :user => {:only => [:email]},
                    :menu_item => {
                        :include => {
                            :dish => {
                                :include => {
                                    :dish_type => { :only => [:id, :name, :extra]}
                                },
                                :except => [:created_at, :updated_at]
                            }
                        },
                        :except => [:created_at, :updated_at]
                    }
                  }, :except => [:updated_at])
            end

            def show
                render json: @order.to_json(:include => {
                    :user => {:only => [:email]},
                    :menu_item => {
                        :include => {
                            :dish => {
                                :include => {
                                    :dish_type => { :only => [:id, :name, :extra]}
                                },
                                :except => [:created_at, :updated_at]
                            }
                        },
                        :except => [:created_at, :updated_at]
                    }
                  }, :except => [:updated_at])
            end

            private 
            
            def set_order
                @order = Order.includes(:user, menu_item: [dish: [:dish_type]]).find(params[:id])
            end

            def order_params
                params.require(:order).permit(:user_id, :menu_item_id, :status)
            end
        end
    end
end
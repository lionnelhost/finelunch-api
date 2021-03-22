module Api
    module V1
        class DishesController < ApplicationController
            before_action :set_dish, only: [:show,:update, :destroy]

            def index 
                @dishes = Dish.includes(:dish_type).all.order(created_at: :DESC).page(@page).per(@per_page)
                
                render status: :ok, json: @dishes.to_json(:include => {
                    :dish_type => {:except => [:created_at, :updated_at]},
                  }, :except => [:updated_at])
                 
            end

            def show
                render status: :ok, json: @dish.to_json(:include => {
                    :dish_type => {:except => [:created_at, :updated_at]},
                  }, :except => [:updated_at])
            end

            def create
                @dish = Dish.new(dish_params)
                if @dish.save!
                render json: {
                        code: 200,
                        message: "dish created successfully"

                }, status: :created
                end
            end

            def update
                if @dish.update!(dish_params)
                    render json: {
                        code: 200,
                        message: "dish updated successfully"

                  }, status: :created
                end
            end
            
            def destroy
                if @dish.destroy!
                    render json: {
                        code: 200,
                        message: "dish destroyed successfully"

                  }, status: :created
                end
            end
            
            

            private
            
            def set_dish
                @dish = Dish.includes(:dish_type).find(params[:id])
            end

            def dish_params
                params.permit(:id, :name,:description, :price, :picture_url, :dish_type_id)
            end
        end
    end
end
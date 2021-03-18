module Api
    module V1
        class DishesController < ApplicationController
            before_action :set_dish, only: [:show]

            def index 
                @dishes = Dish.page(@page).per(@per_page)

                render status: :ok, json: @dishes.to_json(:include => {
                    :dish_type => {:except => [:created_at, :updated_at]},
                  }, :except => [:updated_at])
                 
            end

            def show
                render status: :ok, json: @dish.to_json(:include => {
                    :dish_type => {:except => [:created_at, :updated_at]},
                  }, :except => [:updated_at])
            end

            private 
            
            def set_dish
                @dish = Dish.find(params[:id])
            end

            def dish_params
                params.require(:dish).permit(:name,:description, :price, :picture_url, :dish_type_id)
            end
        end
    end
end
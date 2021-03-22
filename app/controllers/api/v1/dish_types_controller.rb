module Api
    module V1
        class DishTypesController < ApplicationController 
            before_action :set_dish_type, only: [:show]
            def index 
                @dish_types = DishType.page(@page).per(@per_page)

                render json: @dish_types
            end

            def show
                render json: @dish_type
            end

            private 
            
            def set_dish_type
                @dish_type = DishType.find(params[:id])
            end

            def dish_type_params
                params.require(:dish_type).permit(:name,:extra)
            end
        end
    end  
end
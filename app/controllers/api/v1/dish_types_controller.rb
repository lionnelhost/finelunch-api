module Api
    module V1
        class DishTypesController < ApplicationController 
            before_action :set_dish_type, only: [:show, :update, :destroy]
            def index 
                @dish_types = DishType.all.order(created_at: :DESC)

                render json: @dish_types
            end

            def show
                render json: @dish_type
            end

            def create
                @dish_type = DishType.new(dish_type_params)

                if @dish_type.save 
                    render json: {
                        code: :created,
                        message: "dish type create successfully"
                    }, status: :created
                else
                    render json:  {
                        code: 500,
                        message: @dish_type.errors.full_messages
                    }, status: :unprocessable_entity
                end
            end

            def update

                if @dish_type.update(dish_type_params)
                    render json: {
                        code: :updated,
                        message: "dish type updated successfully"
                    }, status: :created
                else
                    render json:  {
                        code: 500,
                        message: @dish_type.errors.full_messages
                    }, status: :unprocessable_entity
                end
            end

            def destroy 
                if @dish_type.destroy
                    render json: {
                        code: :deleted,
                        message: "dish type destroyed successfully"
                    }, status: :created
                else
                    render json:  {
                        code: 500,
                        message: @dish_type.errors.full_messages
                    }, status: :unprocessable_entity
                end
            end
            

            private 
            
            def set_dish_type
                @dish_type = DishType.find(params[:id])
            end

            def dish_type_params
                params.permit(:name,:extra)
            end
        end
    end  
end
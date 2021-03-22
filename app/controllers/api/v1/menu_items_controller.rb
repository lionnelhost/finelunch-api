module Api
    module V1
        class MenuItemsController < ApplicationController
            before_action :set_menu_item, only: [:show]
            def index 
                @menu_items = MenuItem.page(@page).per(@per_page)

                render json: @menu_items.to_json(:include => {
                    :dish => {:except => [:created_at, :updated_at]},
                    :menu => {:only => [:date]}
                  }, :except => [:updated_at])
            end

            def show
                render json: @menu_item.to_json(:include => {
                    :dish => {:except => [:created_at, :updated_at]},
                    :menu => {:only => [:date]}
                  }, 
                  :except => [:updated_at]
                )
            end

            private 
            
            def set_menu_item
                @menu_item = MenuItem.find(params[:id])
            end

            def menu_item_params
                params.require(:menu_item).permit(:dish_id, :menu_id)
            end
        end
    end
end
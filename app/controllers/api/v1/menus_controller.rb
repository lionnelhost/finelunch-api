module Api
    module V1
        class MenusController < ApplicationController
            before_action :set_menu, only: [:show]
            def index 
                @menus = Menu.all

                # render json: @menus, include: [:menu_items]
                render json: @menus.to_json(:include => {
                    :menu_items => {
                        :include => [:dish],
                        :except => [:created_at, :updated_at]
                    },
                  }, :except => [:updated_at])
            end

            def show
                render json: @menu.to_json(:include => {
                    :menu_items => {
                        :include => [:dish],
                        :except => [:created_at, :updated_at]
                    },
                  }, :except => [:updated_at])
            end

            private 
            
            def set_menu
                @menu = Menu.find(params[:id])
            end

            def menu_params
                params.require(:menu).permit(:date)
            end
        end
    end
end
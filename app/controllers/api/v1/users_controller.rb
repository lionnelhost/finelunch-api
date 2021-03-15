module Api
    module V1
        class UsersController < ApplicationController
            before_action :set_user, only: [:show]
            def index 
                @users = User.includes(:profile).all

                render json: @users.to_json(:include => {
                    :profile => {
                        :except => [:created_at, :updated_at]
                    },
                  }, :except => [:created_at, :updated_at])
            end

            def show
                render json: @user.to_json(:include => {
                    :profile => {
                        :except => [:created_at, :updated_at]
                    },
                  }, :except => [:created_at, :updated_at])
            end

            private 
            
            def set_user
                @user = User.find(params[:id])
            end

        end
    end
end
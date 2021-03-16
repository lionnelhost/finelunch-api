module Api
    module V1
        class UsersController < ApplicationController
            before_action :set_user, only: [:show]
            def index 
                @users = User.includes(:profile).all.order(created_at: :DESC)

                render json: @users.to_json(:include => {
                    :profile => {
                        :except => [:created_at,:update_at]
                    },
                  }, :except => [:updated_at])
            end
            
            def create
                @user = User.new(user_params)
                user_profile = Profile.new(profile_params)
                if @user.save
                    user_profile = Profile.new(profile_params)
                    user_profile[:user_id] = @user.id 
                    if user_profile.save
                        render json: {
                            code: :ok,
                            message: "user create successfully!"
                        }, status: :created
                    else
                        render json: {
                            code: 500,
                            message: user_profile.errors.full_messages
                        }, status: :unprocessable_entity 
                    end 
                else
                    render json: {
                        message: @user.errors.full_messages
                    }, status: :unprocessable_entity
                end
            end
            

            def show
                render json: @user.to_json(:include => {
                    :profile => {
                        :except => [:created_at,:update_at]
                    },
                  }, :except => [:updated_at])
            end

            private 
            
            def set_user
                @user = User.find(params[:id])
            end

            def user_params
                params.permit(:email,:password,:password_confirmation)
            end
            
            def profile_params
                params.permit(:firstname,:lastname, :user_id)
            end
        end
    end
end
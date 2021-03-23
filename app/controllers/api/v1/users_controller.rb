module Api
    module V1
        class UsersController < ApplicationController
            before_action :set_user, only: [:show, :update, :destroy]
            before_action :authenticate_user!

            def index 
                @users = User.includes(:profile).order(created_at: :DESC).page(@page).per(@per_page)

                render json: @users.to_json(:include => {
                    :profile => {
                        :except => [:created_at,:update_at]
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

            def update
                
                if @user.update(user_update_params)
                    render json: {
                        code: :ok,
                        message: "user updated successfully!"
                    }, status: :created
                else
                    render json: {
                        message: @user.errors.full_messages
                    }, status: :unprocessable_entity
                end
            end

            def destroy
                if @user.destroy
                    render json: {
                        code: :ok,
                        message: "user deleted successfully!"
                    }, status: :created
                else
                    render json: {
                        message: @user.errors.full_messages
                    }, status: :unprocessable_entity
                end
            end      

            private 
            
            def set_user
                @user = User.includes(:profile).find(params[:id])
            end

            def user_params
                params.permit(:email,:password,:password_confirmation)
            end
            
            def profile_params
                params.permit(:firstname,:lastname, :user_id)
            end
            
            def user_update_params
                params.permit(:id, :role)
            end
        end
    end
end
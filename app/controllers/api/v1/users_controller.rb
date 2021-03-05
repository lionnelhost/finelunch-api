module Api
    module V1
        class UsersController < ApplicationController
            before_action :set_profile, only: [:show]
            def index 
                @users = Profile.all

                render json: @users.to_json(:include => {
                    :user => {
                        :only => [:email]
                    },
                  }, :except => [:updated_at])
            end

            def show
                render json: @user.to_json(:include => {
                    :user => {
                        :only => [:email]
                    },
                  }, :except => [:updated_at])
            end

            private 
            
            def set_profile
                @user = Profile.find(params[:id])
            end

        end
    end
end
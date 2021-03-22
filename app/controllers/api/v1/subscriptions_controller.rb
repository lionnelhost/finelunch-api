module Api
    module V1
        class SubscriptionsController < ApplicationController
            before_action :set_subcription, only: [:show]
            def index 
                @subcriptions = Subscription.page(@page).per(@per_page)

                render json: @subcriptions.to_json(:include => {
                    :user => {:only => [:email]}
                  }, :except => [:updated_at])
            end

            def show
                render json: @subcription.to_json(:include => {
                    :user => {:only => [:email]}
                  }, :except => [:updated_at])
            end

            private 
            
            def set_subcription
                @subcription = Subscription.find(params[:id])
            end

            def subcription_params
                params.require(:subcription).permit(:user_id, :status, :period_start, :period_end)
            end
        end
    end
end
class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        include Errors::ErrorHandler
        include Paginable
        render :json
end

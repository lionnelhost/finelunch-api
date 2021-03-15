class ErrorsController < ApplicationController
    def not_found
        render json: {
          status: 404,
          error: :not_found,
          message: 'Where did the 403 errors go'
        }, status: 404
    end

    def internal_server_error
        render json: {
            status: 500,
            error: :internal_server_error,
            message: 'Birame we have a problem (-____-)'
        }, status: 500
    end
end

# Error module to Handle errors globally
# include Error::ErrorHandler in application_controller.rb
# source https://medium.com/rails-ember-beyond/error-handling-in-rails-the-modular-way-9afcddd2fe1b
module Errors
    module ErrorHandler
      def self.included(clazz)
        clazz.class_eval do
            rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
            rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
        end
      end
  
      private

      def render_unprocessable_entity_response(exception)
        respond(:unprocessable_entity, 422, exception)
      end

      def render_not_found_response(exception)
        respond(:not_found, 404, exception)
      end
      
      def respond(_status, _code, _message)
        json_response = Helpers::Render.json(_status, _code, _message)
        render json: json_response
      end
    end
end
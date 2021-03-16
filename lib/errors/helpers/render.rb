module Errors::Helpers
    class Render
      def self.json(_status, _code,  _error)

        case _code
        when 404
            {
                status: _status,
                code: _code,
                message: _error
            }.as_json
        when 422
            {
                status: _status,
                code: _code,
                message: _error.record.errors
            }.as_json
        else
            
        end
      end
    end
end
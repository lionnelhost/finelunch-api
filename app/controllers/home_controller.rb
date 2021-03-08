class HomeController < ApplicationController 
    def index 
        res = {
            "name": "Finelunch api",
            "version": "1.0.1",
            "description": "Simple rails api for finelunch app",
            "repository": {
                "type": "git",
                "url": "https://github.com/lionnelhost/finelunch-api.git"
              },
            "author": "FineTech Group",
            "license": "MIT"
        }

        render json: res 
    end
end
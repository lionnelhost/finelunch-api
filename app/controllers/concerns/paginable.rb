module Paginable
    extend ActiveSupport::Concern

    included do
        before_action :set_page, only: [:index]
        before_action :set_per_page, only: [:index]
    end

    private 

    def set_page 
        @page  ||= params[:page] || 1 
    end

    def set_per_page
        @per_page ||= params[:per_page] || 20
    end
end
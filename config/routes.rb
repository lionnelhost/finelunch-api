Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'
  namespace 'api' do
    namespace 'v1' do
      resources :dishes, only: [:index, :show, :create, :update, :destroy]
      resources :dish_types, only: [:index, :show, :create, :update, :destroy]
      resources :menus, only: [:index, :show]
      resources :menu_items, only: [:index, :show]
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :orders, only: [:index, :show]
      resources :subscriptions, only: [:index, :show]
    end
  end

  root to: "home#index"
end

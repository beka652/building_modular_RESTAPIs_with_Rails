Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :create, :update, :show, :index, :destroy ]
      resources :posts, only: [ :create, :update, :show, :index, :destroy ]
      resources :comments, only: [ :create, :update, :show, :index, :destroy ]
    end
  end
end

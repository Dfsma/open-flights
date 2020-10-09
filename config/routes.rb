Rails.application.routes.draw do
  devise_for :users
 
  authenticated :user do
    root "pages#open_flights", as: :authenticated_root
  end
  
  root 'pages#open_flights', only: [:show]

  namespace :api do
    namespace :v1 do
      resources :airlines, param: :slug
      resources :reviews, only: [:create, :destroy]
    end
  end

  devise_scope :user do
    get '*path', to: 'devise/sessions#new', via: :all
  end
 

end

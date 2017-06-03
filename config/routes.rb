Rails.application.routes.draw do

  resources :searches
  resources :reservations
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :users, only: [:edit, :update, :index, :show]

  resources :listings

  get 'users/' => 'users#index', :as => :users_index

  root 'users#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

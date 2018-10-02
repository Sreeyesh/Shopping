Rails.application.routes.draw do

  #resources :products

  resources :products do
    collection do
      post :filter
      get :export
    end
  end
  root 'products#index'

  get 'accounts/logout'

  match 'accounts/login', :to => "accounts#login", :as => "login", :via => [:get, :post]
  match 'accounts/signup', :to => "accounts#signup", :as => "signup", :via => [:get, :post]
  match 'accounts/logout', :to => "accounts#logout", :as => "logout", :via => [:get, :post]
  get 'products/filter', :to => "products#filter", :as => "filter"
  get 'products/export', :to => "products#export", :as => "export"
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

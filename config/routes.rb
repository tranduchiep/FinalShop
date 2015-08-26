Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  resources :users, only: [:edit, :update] do
    resources :likes
    resources :wishlists do
      post 'add_product', to: 'wishlists#add_product'
    end
    resources :comments
    resources :ratings
  end
  resources :products

  # -------------------------------------
  # ajax route
  post 'remove_product', to: 'wishlists#remove_product'
  # end
  #   -------------------------------------

  resource :home do
    get '/active-account', to: 'home#active_account'
    get '/active-complete', to: 'home#active_complete'
    post 'active', to: 'home#active'
  end

  namespace :admin do
    root to: "users#index"
    resources :users, :only => [:index, :create, :update, :destroy]
    resources :products
    resources :categories
  end

end

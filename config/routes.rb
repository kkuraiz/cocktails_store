Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: 'cocktails#index'

  # get 'cocktails', to: "cocktails#index", as: "cocktails"
  get 'cocktails/:id', to: "cocktails#show", as: "cocktail", constraints: {id: /\d+/}

  get 'categories', to: "categories#index", as: "categories"
  get 'categories/:id', to: "categories#show", as: "category", constraints: {id: /\d+/}

  post 'cocktails/edit_quantity/:id', to: 'cocktails#edit_quantity', as: "edit_quantity"
  post 'cocktails/add_to_cart/:id', to: 'cocktails#add_to_cart', as: "add_to_cart"
  delete 'cocktails/remove_from_cart/:id', to: 'cocktails#remove_from_cart', as: "remove_from_cart"

  get "checkout", to: "checkouts#show"
  get "success", to: "checkouts#success", as: "success"
  get "cancel", to: "checkouts#cancel", as: "cancel"

  resources :cocktails, only: [:index, :show] do
    collection do
      get "search"
    end
  end

  devise_for :admin_users, ActiveAdmin: :Devise
  ActiveAdmin.routes(self)
  resources :cocktails
end

Rails.application.routes.draw do
  get 'cocktails', to: "cocktails#index", as: "cocktails"
  get 'cocktails/:id', to: "cocktails#show", as: "cocktail", constraints: {id: /\d+/}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

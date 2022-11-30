Rails.application.routes.draw do
  get 'cocktails', to: "cocktails#index", as: "cocktails"
  get 'cocktails/:id', to: "cocktails#show", as: "cocktail", constraints: {id: /\d+/}

  get 'categories', to: "categories#index", as: "categories"
  get 'categories/:id', to: "categories#show", as: "category", constraints: {id: /\d+/}
end

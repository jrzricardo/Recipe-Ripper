Rails.application.routes.draw do
  devise_for :users
  root to: 'landing#index'
  get 'home', to: 'home#index'

  get 'rip_recipe', to: 'recipes#rip'
  # get "/recipes/:name" => "recipes/rip", as: :recipes_rip

  

  resources :recipes, only: [:index, :show] do
    post 'save', on: :member
  end

  resources :recipe_books, only: [:index] do
    delete 'delete', on: :member
  end
end

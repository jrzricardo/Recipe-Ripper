Rails.application.routes.draw do
  root to: 'landing#index'
  get 'home', to: 'home#index'
  get 'recipes/rip', to: 'recipes#rip', as: 'rip_recipe'
  
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :recipes, only: [:index, :show] do
    post 'save', on: :member
  end


  resources :recipe_books, only: [:index] do
    delete 'delete', on: :member
  end
end

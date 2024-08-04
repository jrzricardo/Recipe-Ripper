Rails.application.routes.draw do
  root to: 'landing#index'
  get 'home', to: 'home#index'
  get 'rip_recipe', to: 'recipes#rip'
  
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

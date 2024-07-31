Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  # post '/rip', to: 'recipes#rip'

  resources :recipes, only: [:index, :show] do
    post 'save', on: :member
  end

  resources :recipe_books, only: [:index]
end

end

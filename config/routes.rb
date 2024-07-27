Rails.application.routes.draw do
  resources :recipes, only: [:new, :create, :show]
  root 'recipes#new'
end

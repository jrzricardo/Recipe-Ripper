Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:new, :create, :show]
  root 'recipes#new'
end

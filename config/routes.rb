Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  post '/extract', to: 'recipes#extract'
end

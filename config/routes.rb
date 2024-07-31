Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  post '/rip', to: 'recipes#rip'
end

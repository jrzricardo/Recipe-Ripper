Rails.application.routes.draw do
  root 'recipes#index'
  post '/extract', to: 'recipes#extract'
end

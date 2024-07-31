Rails.application.routes.draw do
  root 'recipes#index'
  post '/rip', to: 'recipes#rip'
end

Rails.application.routes.draw do
  devise_for :users
  resources :recipes do
    collection do
      post :extract
    end
  end
  root 'recipes#index'
end

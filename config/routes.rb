Rails.application.routes.draw do
  devise_for :users
  root "recipes#index"

  resources :recipes do
    collection do
      post :extract
    end
    member do
      post :save
    end
  end
end

Rails.application.routes.draw do
  devise_for :users
  resources :recipes do
    collection do
      post :extract
      post :save_extracted
    end
  end
  root 'recipes#index'
end

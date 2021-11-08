Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :home, only: [:index]
  resources :articles do
    resources :comments
  end

end

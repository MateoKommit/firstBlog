Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :home, only: [:index]
  resources :articles do
    resources :comments
  end

end

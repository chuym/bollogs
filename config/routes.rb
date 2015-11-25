Rails.application.routes.draw do
  namespace :admin do
    resources :login, only: [:index, :create]
    resources :posts
  end
  resources :blog, only: [:index, :show]
end

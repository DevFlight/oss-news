Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :comments
      resources :posts

      root to: "users#index"
    end
  devise_for :users
  
  resources :posts do
    resource :like, module: :posts
    resources :comments, module: :posts
  end

  root "posts#index"
end

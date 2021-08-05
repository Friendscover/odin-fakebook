Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show update] do
    resources :friendships, only: %i[create]
  end

  resources :friendships, only: %i[update]

  resources :posts, only: %i[index show new create] do
    resources :comments, only %i[show new create]
  end

  root 'users#index'
end

Rails.application.routes.draw do
  root 'pages#home'

  resources :topics do
    resources :comments, only: [:create, :destroy]
  end

  devise_for :users
end

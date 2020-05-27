Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "home/index"

  resources :user_clips
  
  resources :clips, only: [:index, :show] do
    resources :opinions, shallow: true
  end

  resources :opinions do
    resources :likes
  end
end

Rails.application.routes.draw do
  resources :user_clips
  resources :clips , only: [:index, :show]
  devise_for :users
  get "home/index"
  root "home#index"
end

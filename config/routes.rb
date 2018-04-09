Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users

    root to: "users#index"
  end

  resources :posts
  root  'static#homepage'
  devise_for :users, skip: :registrations
end

Rails.application.routes.draw do

  get 'index' => 'home#index'

  devise_for :users

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  resources :expenses
  
  root 'home#about'
end

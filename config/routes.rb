Rails.application.routes.draw do

  get 'index' => 'home#index'

  devise_for :users

  authenticated :user do
    root 'expenses#index', as: :authenticated_root
  end

  resources :expenses

  resources :budgets

  root 'home#about'
end

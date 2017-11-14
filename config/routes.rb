Rails.application.routes.draw do
  get 'home/index'

  get 'home/about'

  devise_for :users
  root 'home#index'
end

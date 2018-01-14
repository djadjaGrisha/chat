Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  devise_for :users

  resources :conversations, only: %i[index show new create destroy]
  root 'home#index'
end

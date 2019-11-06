Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :event
  resources :user
  resources :charges
  get '/', to: 'event#index'

end

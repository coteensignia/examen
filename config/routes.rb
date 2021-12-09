Rails.application.routes.draw do

  devise_for :controllers
  devise_for :usuarios

devise_scope :usuario do
  get '/', to: 'devise/sessions#new'
end



  resources :oficinas
  resources :edificios
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

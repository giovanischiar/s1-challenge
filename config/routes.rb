Rails.application.routes.draw do
  resources :ordenations
  resources :configurations
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

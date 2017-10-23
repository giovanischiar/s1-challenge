Rails.application.routes.draw do
  root :to => 'books#index'

  resources :configurations do
  	resources :ordenations
  end
  resources :books do
  	collection do
      get :sort
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

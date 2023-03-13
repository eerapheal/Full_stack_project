Rails.application.routes.draw do
  devise_for :users
  root 'root#index'
  devise_for :users, controllers: {
     registrations: 'users/registrations',
      sessions: 'users/sessions' 
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users do
        resources :registration, only: :create, controller: 'api/v1/users/registration' do 
          post :cancel, action: :destroy, on: :collection
        end
        resources :sessions, only: [:create, :destroy], controller: 'api/v1/users/sessions'
      end
    end
  end
end

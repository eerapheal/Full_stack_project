Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, skip: [:sessions, :registrations],
        controllers: {
          sessions: 'api/v1/users/sessions',
          registrations: 'api/v1/users/registrations',
        }
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

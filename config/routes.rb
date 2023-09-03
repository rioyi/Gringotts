Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "files#index"
  resources :files, only: [:index] do
    collection do
      post :upload
      delete :delete
    end
  end
end

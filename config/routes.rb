Rails.application.routes.draw do
  devise_for :users
  devise_for :developers
  namespace :api do
    namespace :v1 do
      get 'developers/new'
      get 'developers/edit'
      get 'developers/update'
      get 'developers/show'
    end
  end
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

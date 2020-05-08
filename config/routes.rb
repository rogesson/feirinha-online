Rails.application.routes.draw do
  root 'stores#index'

  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post :signup, to: 'registrations#create'
        post :login, to: 'sessions#create'
        delete :logout, to: 'sessions#destroy'
      end

      resources :users
      resources :stores do
        resources :products
      end
    end
  end
end

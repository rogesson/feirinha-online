Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post :signup, to: 'registrations#create'
        post :login, to: 'sessions#create'
        delete :logout, to: 'sessions#destroy'
      end
    end
  end
end

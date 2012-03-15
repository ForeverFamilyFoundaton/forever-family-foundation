ForeverFamilyFoundation::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, controllers: { :registrations => 'registration' } do
    get '/login' => 'devise/sessions#new'
    delete '/logout' => 'devise/sessions#destroy'
  end

  resources :users

  resources :events
  
  root :to => 'site#index'

  resource :adg_registration

  match '/businesses/welcome/:id' => 'businesses#welcome', as: 'businesses_welcome'
  match '/users/welcome/:id' => 'users#welcome', as: 'users_welcome'

  resources :users do
    get :confirm
    put :confirm

    resources :businesses do
      put :register
      post :register
      get :register
      get :attachment
    end
  end

  resource :events

  match ':controller(/:action(/:id))'
end

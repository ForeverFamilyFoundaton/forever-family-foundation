ForeverFamilyFoundation::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, controllers: { :registrations => 'registration' }

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    delete '/logout' => 'devise/sessions#destroy'
  end

  resources :events
  resources :radio_archives

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

  match '/site/page/:id' => 'site#page', as: 'page'
  match ':controller(/:action(/:id))'
end

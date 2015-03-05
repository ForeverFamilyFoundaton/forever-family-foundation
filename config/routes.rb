ForeverFamilyFoundation::Application.routes.draw do

  root :to => 'site#index'

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  devise_for :users, controllers: { :registrations => 'registration' }

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    delete '/logout' => 'devise/sessions#destroy'
  end

  resources :events
  resources :radio_archives
  resource :adg_registration

  get '/businesses/welcome/:id' => 'businesses#welcome', as: 'businesses_welcome'
  get '/users/welcome/:id' => 'users#welcome', as: 'users_welcome'

  resources :users do
    get :confirm
    put :confirm
    get :edit_password
    put :update_password

    resources :businesses do
      get :payment
      put :payment
      post :payment
      put :register
      post :register
      get :register
      get :attachment
    end
  end

  resources :exports
  resource :events

  get '/site/page/:id' => 'site#page', as: 'page'
  get ':controller(/:action(/:id))'
end

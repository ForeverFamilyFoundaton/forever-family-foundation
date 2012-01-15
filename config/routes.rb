ForeverFamilyFoundation::Application.routes.draw do
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  devise_for :users, controllers: { :registrations => "registrations" } do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end
  
  root :to => "site#index"

  resource :adg_registration

  # resource :businesses do
  #   get 'welcome'
  # end

  resources :users do
    get 'welcome'
    resources :businesses do
      get :attachment
    end
  end

  resource :events
    
  match ':controller(/:action(/:id))'
end

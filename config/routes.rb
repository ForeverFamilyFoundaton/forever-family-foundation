ForeverFamilyFoundation::Application.routes.draw do
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "site#index"
  
  match 'home' => "welcome#logged_in_index"  
  
  resource :adg_registration
  resource :user_session
  resource :user, :as => :account

  resource :businesses
  
  resources :users do
    get :confirm
    resources :businesses do
      get :attachment
    end
  end

  resources :events
    
  match ':controller(/:action(/:id))'
end

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
  resources :recommended_book
  resource :adg_registration
  resource :redirects

  get '/businesses/welcome/:id' => 'businesses#welcome', as: 'businesses_welcome'
  get '/users/welcome/:id' => 'users#welcome', as: 'users_welcome'


  #get '/sitemap.xml', to: redirect("http://s3.amazonaws.com/fff_attached_files/attached_files/attachments/000/000/670/original/sitemap.xml?2016"), as: :sitemap

  # Redirects
  get '/sitemap' => 'redirects#sitemap' #'http://s3.amazonaws.com/fff_attached_files/attached_files/attachments/000/000/670/original/sitemap.xml?2016'
  get '/certifiedmediums' => 'redirects#certified_mediums'
  get '/Suicide' => 'redirects#suicide'
  get '/contributions' => 'redirects#contributions'
  get '/signsofliferadio' => 'redirects#signs_of_life_radio'
  get '/signsofliferadioLISTEN' => 'redirects#signs_of_life_radio'
  get '/radio' => 'redirects#signs_of_life_radio'
  get '/radio2007' => 'redirects#signs_of_life_radio'
  get '/SanFransiscoTravel' => 'redirects#home_page'
  get '/NewYork2008CC' => 'redirects#home_page'
  get '/images/Events/TG0726-2813CT-SponsorProgramOpp.pdf' => 'redirects#home_page'
  get '/images/Events/TG0520-2211CT-FLYER2v4TABS.pdf' => 'redirects#home_page'
  get '/mobile/events/94' => 'redirects#events'
  get '/FMC2010' => 'redirects#events'
  get '/images/SF2008IMAGES/SF2008ProgramPRG.pdf' => 'redirects#events'
  get '/bookreview' => 'redirects#recommended_books'
  get '/images/GuestHouse/TheGuestHouse-brochure' => 'redirects#guest_house_brochure'


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

  resource :events

  get '/site/page/:id' => 'site#page', as: 'page'
  get ':controller(/:action(/:id))'
end

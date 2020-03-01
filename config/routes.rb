require 'sidekiq/web'

ForeverFamilyFoundation::Application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'

  root to: 'site#index'

  match '/404', to: 'exceptions#not_found', via: :all
  match '/500', to: 'exceptions#internal_error', via: :all
  match '/422', to: 'exceptions#unacceptable', via: :all

  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :user do
    root 'users#show' # creates user_root_path
  end

  resources :users, only: :show
  resources :businesses
  resources :subscriptions

  # begin old routes
  resources :belief_types
  resources :tests
  resources :known_deads
  resources :relationships

  resources :events
  resources :radio_archives
  resources :recommended_book
  resource :adg_registration
  resource :redirects
  resources :sitterforms
  resources :mediumforms
  resources :known_deads

  get '/businesses/welcome/:id' => 'businesses#welcome', as: 'businesses_welcome'
  get '/users/welcome/:id' => 'users#welcome', as: 'users_welcome'

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
  get '/site/:action' => 'site#page', as: 'page'
  get '/site/page/:id' => 'site#page', as: 'page_by_id'
end

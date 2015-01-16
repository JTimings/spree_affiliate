Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :affiliate_settings
  end

  resources :affiliates, :only => [:show, :index]

  get '/invite', to: 'invite#index', as: 'invite'
  devise_scope :spree_user do
  	get '/invite/:ref_id', to: 'user_registrations#new', as: 'invite_recipient'
  end

end
Rails.application.routes.draw do
  
  root    'pages#home'
  get     '/about',   to: 'pages#about'
  get     '/donate',  to: 'pages#donate'
  
  get     '/partners/signup',   to: 'partners#new'
  get     '/partners/login',    to: 'partner_sessions#new'
  post    '/partners/login',    to: 'partner_sessions#create'
  delete  '/partners/logout',   to: 'partner_sessions#destroy'
  resources :partner_panel
  resources :my_campaigns
  
  get     '/donors/signup',  to: 'donor_panel#new'
  get     '/donors/login',   to: 'donor_sessions#new'
  post    '/donors/login',   to: 'donor_sessions#create'
  delete  '/donors/logout',  to: 'donor_sessions#destroy'
  resources :donor_panel
  
  get     '/admins/dashboard',  to: 'admins#dashboard'
  get     '/admins/signup',     to: 'admins#new'
  get     '/admins/login',      to: 'admin_sessions#new'
  post    '/admins/login',      to: 'admin_sessions#create'
  delete  '/admins/logout',     to: 'admin_sessions#destroy'
  
  resources :partners do
    resources :campaigns, shallow: true
  end
  
  resources :campaigns
  resources :donors
  resources :admins
  
end

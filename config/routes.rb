Rails.application.routes.draw do
  
  get 'admin_sessions/new'

  get 'donor_sessions/new'

  root    'pages#home'
  get     '/about',   to: 'pages#about'
  get     '/donate',   to: 'pages#donate'
  
  get     '/partners/signup',  to: 'partners#new'
  get     '/partners/login',   to: 'partner_sessions#new'
  post    '/partners/login',   to: 'partner_sessions#create'
  delete  '/partners/logout',  to: 'partner_sessions#destroy'
  
  get     '/donors/signup',  to: 'donors#new'
  get     '/donors/login',   to: 'donor_sessions#new'
  post    '/donors/login',   to: 'donor_sessions#create'
  delete  '/donors/logout',  to: 'donor_sessions#destroy'
  
  get     '/admins/signup',  to: 'admins#new'
  get     '/admins/login',   to: 'admin_sessions#new'
  post    '/admins/login',   to: 'admin_sessions#create'
  delete  '/admins/logout',  to: 'admin_sessions#destroy'
  
  resources :partners
  resources :campaigns
  resources :donors
  resources :admins
  
end

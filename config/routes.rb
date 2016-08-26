Rails.application.routes.draw do
  
  root    'front_pages#home'
  get     '/about',   to: 'front_pages#about'
  
  get     '/partners/signup',  to: 'partners#new'
  post    '/partners/signup',  to: 'partners#create'
  get     '/partners/login',   to: 'partner_sessions#new'
  post    '/partners/login',   to: 'partner_sessions#create'
  delete  '/partners/logout',  to: 'partner_sessions#destroy'
  
  resources :partners
  
end

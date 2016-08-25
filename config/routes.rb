Rails.application.routes.draw do
  
  root 'front_pages#home'
  get  '/about',   to: 'front_pages#about'
  get  '/partners/signup',  to: 'partners#new'
  post '/partners/signup',  to: 'partners#create'
  
  resources :partners
  
end

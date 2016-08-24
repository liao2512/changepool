Rails.application.routes.draw do
  get 'front_pages/home'

  get 'front_pages/about'

  root 'application#hello'
end

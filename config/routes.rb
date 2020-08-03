Rails.application.routes.draw do
  get 'static_pages/home'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  
end

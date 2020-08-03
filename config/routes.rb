Rails.application.routes.draw do
  get '/welcome/:first_name', to: 'dynamic_pages#user'
  get '/home', to: 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get '/gossipinfo/:id', to: 'dynamic_pages#gossip', as: 'gossip_info'
  get '/userinfo/:id', to: 'dynamic_pages#user_page', as: 'user_info'
end

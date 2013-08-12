Bebas::Application.routes.draw do
  devise_for :users
  root :to => 'index#startpage'
  get  '/users' => 'users#index'
  get '/profile/:user' => 'users#show'
  post '/users/search' => 'users#search'
  get '/guestbook' => 'guestbook/messages#index' 
  post '/guestbook' => 'guestbook/messages#create'

end

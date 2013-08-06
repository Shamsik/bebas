Bebas::Application.routes.draw do
  devise_for :users
  root :to => 'index#startpage'
  get  '/users' => 'users#index'
  get '/profile/:user' => 'users#show'
  post '/users/search' => 'users#search'
  get '/news' => 'news/articles#index'
  get '/guestbook' => 'guestbook/messages#index' 
  post '/guestbook/say' => 'guestbook/messages#say'
  get 'guestbook/say' => 'guestbook/messages#say'
end

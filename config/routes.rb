Bebas::Application.routes.draw do
  devise_for :users
  root :to => 'guestbook/messages#index'
  get  '/users' => 'users#index'
  get '/profile/:user' => 'users#show'
  get '/' => 'index#startpage'
  get '/news' => 'news/articles#index'
  get '/guestbook' => 'guestbook/messages#index' 
  post '/guestbook/say' => 'guestbook/messages#say'
  get 'guestbook/say' => 'guestbook/messages#say'
end

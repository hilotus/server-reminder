ServerReminder::Application.routes.draw do
  mount Resque::Server, :at => '/resque'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      # User
      get '/users/me', :to => 'users#validate'
      get '/login', :to => 'users#login'
      get '/_User', :to => 'users#find'
      post '/users', :to => 'users#setup'
      post '/getToken', :to => 'users#getToken'

      # Term
      get '/Term', :to => 'terms#find'

      # Event
      post '/Event', :to => 'events#create'
      get '/Event', :to => 'events#find'
    end
  end
end
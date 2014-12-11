ServerReminder::Application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      # User
      get '/users/me', :to => 'users#validate'
      get '/login', :to => 'users#login'
      get '/_User', :to => 'users#find'
      post '/users', :to => 'users#setup'

      # Term
      get '/Term', :to => 'terms#find'
    end
  end
end
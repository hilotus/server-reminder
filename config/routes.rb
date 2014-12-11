ServerReminder::Application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get '/users/me', :to => 'users#validate'
      get '/login', :to => 'users#login'
    end
  end
end
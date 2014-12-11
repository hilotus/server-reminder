ServerReminder::Application.routes.draw do
  get '/1/users/me', :to => 'users#validate'
end
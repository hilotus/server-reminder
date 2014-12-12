set :server_name, 'reminderws.hilotus.com'

set :full_app_name, "#{fetch(:application)}"

server 'reminderws.hilotus.com', user: 'ubuntu', roles: %w{web app db}, primary: true

set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

set :shared_path, "#{fetch(:deploy_to)}/shared"

set :rails_env, :production

set :unicorn_worker_count, 4

set :enable_ssl, false
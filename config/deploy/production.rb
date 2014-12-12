set :server_name, 'reminderws.hilotus.com'

set :full_app_name, "#{fetch(:application)}"

server 'reminderws.hilotus.com', user: 'ubuntu', roles: %w{web app db}, primary: true

set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

set :shared_path, "#{fetch(:deploy_to)}/shared"

set :rails_env, :production

set :unicorn_worker_count, 4

set :enable_ssl, false

# resque
# Specify the server that Resque will be deployed on. If you are using Cap v3
# and have multiple stages with different Resque requirements for each, then
# these __must__ be set inside of the applicable config/deploy/... stage files
# instead of config/deploy.rb:
role :resque_worker, "#{fetch(:deploy_user)}@#{fetch(:server_name)}"
role :resque_scheduler, "#{fetch(:deploy_user)}@#{fetch(:server_name)}"

set :workers, {"*" => 1}

# We default to storing PID files in a tmp/pids folder in your shared path, but
# you can customize it here (make sure to use a full path). The path will be
# created before starting workers if it doesn't already exist.
set :resque_pid_path, File.join(fetch(:shared_path), 'tmp', 'pids')

# Uncomment this line if your workers need access to the Rails environment:
set :resque_environment_task, true

set :resque_log_file, File.join(fetch(:shared_path), 'log', 'resque.log')

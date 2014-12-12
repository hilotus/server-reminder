# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'server-reminder'
set :deploy_user, 'ubuntu'

set :scm, :git
set :repo_url, 'https://CBluowei:51e28f46268698f4baa79e5f72ff5e3b076667ea@github.com/hilotus/server-reminder.git'
set :branch, 'master'

set :keep_releases, 5

set(:linked_files, %w(config/mongoid.yml))

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# without any test
# set :tests, %w(spec)
set :tests, []

# custom configuration
set(:config_files, %w(
  mongoid.yml
  nginx.conf
  unicorn.rb
  unicorn_init.sh
))

# unicorn commond
set(:executable_config_files, %w(
  unicorn_init.sh
))

set(:symlinks, [
  {
    source: "nginx.conf",
    link: "/etc/nginx/sites-enabled/{{full_app_name}}"
  },
  {
    source: "unicorn_init.sh",
    link: "/etc/init.d/unicorn_{{full_app_name}}"
  }
])

namespace :deploy do
  # only allow a deploy with passing tests to deployed
  before :deploy, "deploy:run_tests"

  after "deploy:run_tests", 'deploy:setup_config'

  after 'deploy:restart', 'nginx:restart'

  # resque workers and scheduler
  after "deploy:restart", "resque:restart", "resque:scheduler:restart"

  after :deploy, "deploy:restart"

  after :rollback, "deploy:restart"

  after :finishing, 'deploy:cleanup'
end
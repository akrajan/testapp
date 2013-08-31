require 'bundler/capistrano'

set :application, "testapp"
set :scm, :git
set :repository, "git@github.com:akrajan/testapp.git"
#server "localhost", :web, :app, :db, :primary => true
#ssh_options[:port] = 2222
#ssh_options[:keys] = "~/.vagrant.d/insecure_private_key"

set :user, "vagrant"
set :group, "vagrant"
set :deploy_to, "/var/seattle_install"
set :use_sudo, false


# multistage
set :stages, %w(production staging)
set :default_stage, "staging"
set :rails_env, 'staging'
require 'capistrano/ext/multistage'


#copy strategy
set :deploy_via, :copy
set :copy_strategy, :export

set :whenever_command, "bundle exec whenever"
set :whenever_environment, defer { stage }
set :whenever_roles, [:task_master]
set :environment, defer {stage}

require "whenever/capistrano"

#run migrations
after "deploy:update_code", "deploy:migrate"

#tasks
namespace :deploy do
  task :start do; end
  task :stop do; end

  desc "Restart the application"
  task :restart, :roles => :app, :except => {:no_release => true} do
    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end

  desc "Flush existing cron jobs and reinstall them"
  task :install_crontab, :roles => :task_master, :except => {:no_release => true} do
    whenever.update_crontab
  end
end

#after "deploy", "deploy:install_crontab"

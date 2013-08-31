set :user, "ubuntu"
set :group, "ubuntu"

server "ec2-54-212-21-224.us-west-2.compute.amazonaws.com", :app, :db, :web, primary: true

ssh_options[:keys] = ["~/.ssh/seattle_install.pem"]
ssh_options[:port] = 22
set :branch, :master
set :rails_env, 'production'

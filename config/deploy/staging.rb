set :user, "ubuntu"
set :group, "ubuntu"

server "ec2-54-212-224-247.us-west-2.compute.amazonaws.com", :app, :db, :web, primary: true
server "ec2-54-212-36-150.us-west-2.compute.amazonaws.com", :app, :web
server "ec2-54-214-163-224.us-west-2.compute.amazonaws.com",  :app, :web

ssh_options[:keys] = ["~/.ssh/seattle_install.pem"]
ssh_options[:port] = 22
set :branch, :master
set :rails_env, 'production'

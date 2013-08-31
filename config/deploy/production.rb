set :user, "ubuntu"
set :group, "ubuntu"

server "ec2-50-112-19-108.us-west-2.compute.amazonaws.com", :app, :db, :task_master, :primary => true
server "ec2-54-244-146-34.us-west-2.compute.amazonaws.com", :app, :web
server "ec2-54-245-21-5.us-west-2.compute.amazonaws.com", :app, :web
server "ec2-54-218-192-25.us-west-2.compute.amazonaws.com", :app, :web

ssh_options[:keys] = ["~/.ssh/seattle_install.pem"]
ssh_options[:port] = 22
set :branch, :master
set :rails_env, 'production'

set :user, "ubuntu"
set :group, "ubuntu"

# task server
server "ec2-54-244-189-184.us-west-2.compute.amazonaws.com", :app, :task_master

# web servers
server "ec2-50-112-80-87.us-west-2.compute.amazonaws.com", :app, :web, :db, :primary => true

ssh_options[:keys] = ["~/.ssh/seattle_install.pem"]
ssh_options[:port] = 22
set :branch, :staging
set :rails_env, 'staging'

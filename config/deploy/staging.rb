set :stage, :production
set :rails_env, :production
set :rack_env, :production
set :branch, 'main'
set :deploy_to, '/var/www/demo_deploy'

server "18.142.86.126", user: "ubuntu", roles: %w(web app db)

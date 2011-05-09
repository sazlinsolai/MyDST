# Using the plugin
#load 'vendor/plugins/thinking-sphinx/lib/thinking_sphinx/deploy/capistrano'
# If using the ThinkingSphinx gem, use the following instead.
# require 'thinking_sphinx/deploy/capistrano'


#############################################################
#	Application
#############################################################

set :application, "MyDST"
set :deploy_to, "/home/cs8/#{application}"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, false
set :scm_verbose, true
set :rails_env, "production"

#############################################################
#	Servers
#############################################################

set :user, "cs8"
set :domain, "209.20.83.137"
ssh_options[:port] = 30
server domain, :app, :web
role :db, domain, :primary => true

#############################################################
#	Git
#############################################################

set :scm, :git
set :branch, "master"
set :scm_user, 'cs8'
set :scm_passphrase, "Consoci802*"
set :repository, "git@github.com:sazlinsolai/MyDST.git"
set :deploy_via, :remote_cache

#############################################################
#	Passenger
#############################################################

namespace :deploy do
  desc "Create the database yaml file, symlink upload files, etc"
  after "deploy:update_code" do
  #task :after_update_code do
    #########################################################
    # Database yml settings
    #########################################################
    db_config = <<-EOF
    production:
      adapter: mysql
      encoding: utf8
      username: root
      password: biz@2010
      database: mydst_production
      pool: 10
      socket: /var/run/mysqld/mysqld.sock
      host: localhost
    EOF

    put db_config, "#{release_path}/config/database.yml"

    #########################################################
    # Symlink an uploads directory.
    #########################################################
#    %w{profile_pictures}.each do |share|
#      run "rm -rf #{release_path}/public/#{share}"
#      run "mkdir -p #{shared_path}/system/#{share}"
#      run "ln -nfs #{shared_path}/system/#{share} #{release_path}/public/#{share}"
#    end

    #########################################################
    # If you're deploying to a relative url path, uncomment below
    # set ENV['RAILS_RELATIVE_URL_ROOT'] for mod_rails (phusion passenger)"
    #########################################################
#    tmp = "#{current_release}/tmp/environment.rb"
#    final = "#{current_release}/config/environment.rb"
#    run <<-CMD
#       echo "ENV['RAILS_RELATIVE_URL_ROOT'] = '/#{application}' " > #{tmp};
#       cat #{final} >> #{tmp} && mv #{tmp} #{final};
#    CMD

    #########################################################
    # Email settings.
    #########################################################
    email_config = <<-EOF
      ActionMailer::Base.delivery_method = :smtp
      ActionMailer::Base.smtp_settings = {
        :address => "mail.socialwalk.com",
        :port => "2525",
        :domain => "socialwalk.com",
        :authentication => :login,
        :user_name => "saiful.afifi@socialwalk.com",
        :password => "fefer24"
      }
    EOF

    put email_config, "#{release_path}/config/initializers/setup_mail.rb"

    #########################################################
    # Site settings.
    #########################################################
#   site_config = <<-EOF
#     site_url: http://218.111.147.12
#     site_name: MIBPC
#     admin_email: fadhlirahim@gmail.com
#     mdecweb_site: http://218.111.147.11/mdecweb
#     mdecweb_api: NbonRnHD6VfLRTNe9hu3
#   EOF

#   put site_config, "#{release_path}/config/settings.yml"

  end


  # Restart passenger on deploy
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end

end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end

  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} && bundle install"
  end
end

after "deploy", "deploy:symlink", "deploy:cleanup", "bundler:bundle_new_release"


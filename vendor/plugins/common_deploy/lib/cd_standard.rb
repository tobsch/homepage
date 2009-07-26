unless defined?(SKIP_DEFAULT_ROLES)
  role :app, 'tobias-schlottke.de'
  role :web, 'tobias-schlottke.de'
  role :db,  'tobias-schlottke.de', :primary => true
end

set :repository,  "svn+ssh://rails@tobias-schlottke.de/var/www/svn.tobias-schlottke.de/#{application}/trunk"
set :tld, 'de' unless defined?(tld)
set :deploy_to, "/var/www/#{application}.#{tld}"

set :user, 'rails'
set :use_sudo, false

# Find all ssh keys on this machine and try to use em all
ssh_options[:keys] = Dir['/Users/*/.ssh/id_?sa', '/home/*/.ssh/id_?sa']

set :rails_config_files, [ 'database' ]

set :rails_env, :production

# Deployment Section
# ==================
#
# The deployment is handled by capistrano, we're just adding a few hooks
# to the standard capistrano deployment tasks.
# Each deployment task may have a before_ or after_ hook. Capistrano is
# doing the following steps on a normal deploy:
#
# - update
# - update_code
# - finalize_update
# - symlink
# - restart
#
# The stop/start/restart tasks are new tasks and are not using the
# default capistrano tasks.

after "deploy:symlink", "share:rails_config"
after "deploy:symlink", "share:assets"

after "deploy:restart", "deploy:web:enable"

after "deploy:start", "app:passenger:restart"
after "deploy:start", "deploy:web:enable"

namespace :deploy do
  namespace :web do
    task :enable, :roles => :app do
      run "rm #{current_path}/public/maintenance.html"
    end
    
    task :disable, :roles => :app do
      run "svn up #{current_path}/public/maintenance.html"
    end
    
  end

  task :restart, :roles => :app do
    app.passenger.restart
  end
end

# Share stuff
# ===========
#
# Several data and configurations should stay the way they are
# between deployments. These tasks will make sure some necessary
# data are still in place after the deployment is done.

namespace :share do
  desc 'Install application configuration in the latest release'
  task :rails_config do
    rails_config_files.each do |type|
      run "cp #{current_path}/config/#{type}/#{rails_env}.yml #{current_path}/config/#{type}.yml"
    end
  end
  
  task :assets do
    run "ln -nfs #{deploy_to}/shared/uploads #{release_path}/public"
  end
end

# Passenger specific stuff
# ===========
#
namespace :app do
  namespace :passenger do
    desc 'Signal Passenger to restart the application.'  
    task :restart, :roles => :app, :except => { :no_release => true } do  
      run "touch #{release_path}/tmp/restart.txt"  
    end
  end
end
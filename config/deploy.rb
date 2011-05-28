require './config/boot'
require 'common_deploy'

set :git_server, 'git@git.adyard.de'
set :application, 'tobias-schlottke'
set :repository, 'git@git.adyard.de:tobias-schlottke.git'

# no database config
set :rails_config_files, [ ]

load_extensions :rvm, :bundler, :passenger

role :app, 's1.hamburg-ventures.de'
role :web, 's1.hamburg-ventures.de'
role :db,  's1.hamburg-ventures.de', :primary => true
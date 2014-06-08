require './config/boot'
require 'common_deploy'

set :git_server, 'git@git.adyard.de'
set :application, 'tobias-schlottke'
set :repository, 'git@git.metrigo.com:root/homepage.git'

load_extensions :rvm, :bundler, :passenger, :assets

role :app, 's2.hamburg-ventures.de'
role :web, 's2.hamburg-ventures.de'
role :db,  's2.hamburg-ventures.de', :primary => true
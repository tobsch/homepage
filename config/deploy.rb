set :application, 'tobias-schlottke'

SKIP_DEFAULT_ROLES = true
role :app, 's3.adfarm.adyard.de'
role :web, 's3.adfarm.adyard.de'
role :db,  's3.adfarm.adyard.de', :primary => true

load_paths << 'vendor/plugins/common_deploy/lib'
load 'cd_standard'
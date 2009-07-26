namespace :app do
  namespace :db do
    desc 'Backup the current live database and commit the backup to svn'
    task :backup, :roles => :app do
      cd = "cd #{current_path} && "

      # delete current backup
      run "#{cd}svn rm db/export && svn ci db/export -m 'removing current data-dump'" rescue nil

      # re-backup
      run "#{cd}OVERWRITE=true rake db:super_export"
      run "#{cd}svn add db/export && svn ci db/ -m 're-importing backup'"
    end
  end
end

namespace :share do
  task :assets do
    run "ln -nfs #{deploy_to}/shared/assets #{release_path}/public/assets"
  end
end
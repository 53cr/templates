#---------------  Git  -------------------#
git :init
 
file '.gitignore', %Q{
  .DS_Store
  log/*.log
  tmp/**/*
  config/database.yml
  db/*.sqlite3
}
 
git :add => '.', 
    :commit => "-m 'Initial Commit'"

#---------------  Gems  ------------------#
gem 'thoughtbot-shoulda', 
     :lib    => 'shoulda', 
     :source => 'http://gems.github.com'

gem 'thoughtbot-factory_girl', 
    :lib    => 'factory_girl', 
    :source => 'http://gems.github.com'

#gem 'stefanpenner-my_scaffold', 
#    :lib => false, 
#    :source  => 'http://gems.github.com'

rake 'gems:install'

git :add    => '.',
    :commit => "-a -m 'added gems.'"

#---------------  Plugins ----------------"

run 'haml --rails .'

plugin 'hoptoad_notifier',
       :git => 'git://github.com/thoughtbot/hoptoad_notifier.git'

plugin 'active_scaffold', 
       :git => 'git://github.com/activescaffold/active_scaffold.git'

plugin 'action_mailer_tls',
       :git => 'git://github.com/stefanpenner/action_mailer_tls.git'

git :add    => '.',
    :commit => "-a -m 'added plugins.'"


#---------------  Engines  ---------------#

# Core Engine
git :clone => 'git@github.com:53cr/core.git vendor/plugins/core'
 
run 'rsync -ruv vendor/plugins/core/db/migrate db'
run 'rsync -ruv vendor/plugins/core/public .' 
run 'rsync -ruv vendor/plugins/core/config/initializers config/' 
run 'rsync -ruv vendor/plugins/core/app/views/user_mailer app/views/'
 
git :add    => '.',
    :commit => "-a -m 'added core engine plugin.'"
 

#---------------  App  -------------------#

file 'app/controllers/application_controller.rb',%q{
class ApplicationController < ActionController::Base
  protect_from_forgery
 
  include HoptoadNotifier::Catcher
  include Chromium53::Authentication::ApplicationController 
end
}

git :add    => '.',
    :commit => "-a -m 'built controller'"

#---------------  Capistrano  ------------#
 
#
# git :add    => '.',
#     :commit => "-a -m 'adding capistrano files.'"
#

#---------------  Migrations  ------------#

system "rake db:migrate"

#---------------  Cleanup  ---------------#
run 'rm public/index.html'

git :add    => '.',
    :commit => "-a -m 'templating cleanup.'"
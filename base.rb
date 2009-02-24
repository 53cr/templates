run "echo TODO > README"

#Gems
gem 'thoughtbot-shoulda', :lib => 'shoulda', :source => "http://gems.github.com"
gem 'thoughtbot-factory_girl', :lib => 'factory_girl', :source => "http://gems.github.com"
# Stef is fixing this, doesn't work atm
#gem 'stefanpenner-my_scaffold', :lib => false, :source  => "http://gems.github.com"
rake "gems:install"

#Plugin
plugin "active_scaffold", :git => "git://github.com/activescaffold/active_scaffold.git"

#Haml
run "haml --rails ."

#Git
git :init

file ".gitignore", <<END
  .DS_Store
  log/*.log
  tmp/**/*
  config/database.yml
  db/*.sqlite3
END

git :add => ".", :commit => "-m 'Initial Commit'"

#route "..."
#...

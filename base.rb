run "echo TODO > README"

#Gems
gem 'thoughtbot-shoulda', :lib => 'shoulda', :source => "http://gems.github.com"
gem 'thoughtbot-factory_girl', :lib => 'factory_girl', :source => "http://gems.github.com"
gem 'stefanpenner-my_scaffold', :lib => false, :source  => "http://gems.github.com"
rake "gems:install"

#Haml
run "haml --rails ."

#Git
git, :init

file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

git :add => ".". :commit => "Initial Commit"

#route "..."
#...

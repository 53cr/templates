load_template "http://github.com/53cr/templates/raw/master/base.rb"

# Load Core
git :clone => "git@github.com:53cr/core.git vendor/plugins/core"#, :checkout => "edge origin/edge"

# "Coreify"
system "rsync -ruv vendor/plugins/core/db/migrate db" # required for now
system "rsync -ruv vendor/plugins/core/public ." # possibly only copy curtain things
system "rsync -ruv vendor/plugins/core/config/initializers config/" # hack this should turn into configeration tools for each engine
Dir.glob("vendor/plugins/core/vendor/plugins/**").each do |plugin|
  # Doesn't work
  system "./script/plugin install #{plugin}/"
end
system "rsync -ruv vendor/plugins/core/app/views/user_mailer app/views/"

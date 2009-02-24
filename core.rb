load_template "http://github.com/53cr/templates/raw/master/base.rb"

# Load Core

# "Coreify"
run "rsync -ruv vendor/plugins/core/db/migrate db"
run "rsync -ruv vendor/plugins/core/public ."
run "rsync -ruv vendor/plugins/core/config/initializers config/"
run "rsync -ruv vendor/plugins/core/vendor/plugins vendor/plugins"
run "rsync -ruv vendor/plugins/core/app/views/user_mailer app/views/"

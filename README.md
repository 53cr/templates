Add me to your bash or zsh rc:
[DOESN'T WORK YET, Private repo won't work]
    function railsapp {
      template=$1
      appname=$2
      shift 2
      rails $appname -m https://github.com/53cr/templates/raw/master/$template.rb $@
    }

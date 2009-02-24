Add me to your bash or zsh rc:

    function railsapp {
      template=$1
      appname=$2
      shift 2
      rails $appname -m http://github.com/53cr/templates/raw/master/$template.rb $@
    }

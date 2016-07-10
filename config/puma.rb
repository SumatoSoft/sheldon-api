# #!/usr/bin/env puma

# directory '/var/www/sheldonbot/current'
# rackup "/var/www/sheldonbot/current/config.ru"
# environment 'production'

# pidfile "/var/www/sheldonbot/shared/tmp/pids/puma.pid"
# state_path "/var/www/sheldonbot/shared/tmp/pids/puma.state"
# stdout_redirect '/var/www/sheldonbot/shared/log/puma_access.log', '/var/www/sheldonbot/shared/log/puma_error.log', true

# threads 0,16

# bind 'unix:///var/www/sheldonbot/shared/tmp/sockets/puma.sock'

# workers 0

# prune_bundler

# on_restart do
#   puts 'Refreshing Gemfile'
#   ENV["BUNDLE_GEMFILE"] = "/var/www/sheldonbot/current/Gemfile"
# end
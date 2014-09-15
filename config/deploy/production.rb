location = '162.243.48.224'

role :app, location
role :web, location
role :db,  location

server location, user: 'adtrex', roles: %w{web app db}, primary: true

set :ssh_options, { user: 'adtrex' }

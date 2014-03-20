require 'dotenv'
Dotenv.load

require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'pony'

Pony.options = {
  :via => :smtp,
  :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/ddl3r9urh0p0sb')

enable :sessions

require_relative 'config/initializers/carrierwave'
require_relative 'uploaders/image_uploader'
require_relative 'models/models'
require_relative 'helpers/helpers'
require_relative 'routes/routes'


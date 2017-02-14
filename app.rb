require 'dotenv'
Dotenv.load

require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'pony'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/webdevstory_development')

enable :sessions

require_relative 'config/initializers/pony'
require_relative 'config/initializers/carrierwave'
require_relative 'uploaders/image_uploader'
require_relative 'models/models'
require_relative 'helpers/helpers'
require_relative 'routes/routes'


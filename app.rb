require "sinatra"
require "sinatra/activerecord"
require "bcrypt"

set :database, ENV['DATABASE_URL'] || 'postgres://localhost/bridge_development'

enable :sessions

require_relative 'models/models'
require_relative 'helpers/helpers'
require_relative 'routes/routes'
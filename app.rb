require "sinatra"
require "sinatra/activerecord"
require "bcrypt"

#set :database, ENV['DATABASE_URL'] || 'postgres://localhost/bridge_development'
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/ddl3r9urh0p0sb')

enable :sessions

require_relative 'models/models'
require_relative 'helpers/helpers'
require_relative 'routes/routes'
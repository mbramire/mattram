require 'sinatra'
require "sinatra/activerecord"

set :database, ENV['DATABASE_URL'] || 'postgres://localhost/bridge_development'

require_relative 'models/models'
require_relative 'helpers/helpers'
require_relative 'routes/routes'
require 'sinatra'
require "sinatra/activerecord"

set :database, ENV['DATABASE_URL'] || 'postgres://localhost/bridge_development'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments
end

class Comment < ActiveRecord::Base
  validates :name, presence: true
  validates :body, presence: true

  belongs_to :post
end


require_relative 'helpers/helpers'
require_relative 'routes/routes'
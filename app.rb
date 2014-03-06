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

helpers do
  # If @title is assigned, add it to the page's title.
  def title
    if @title
      "#{@title} -- My Blog"
    else
      "My Blog"
    end
  end
 
  # Format the Ruby Time object returned from a post's created_at method
  # into a string that looks like this: 06 Jan 2012
  def pretty_date(time)
   time.strftime("%B %d, %Y")
  end

  def post_show_page?
    request.path_info =~ /\/posts\/\d+$/
  end

  def delete_post_button(post_id)
    haml :_delete_post_button, locals: { post_id: post_id}
  end

  def truncate(body)
    "#{body.slice!(0..20)}..."
  end
end

require_relative 'routes/routes'
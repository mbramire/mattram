class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :category_id, presence: true
  belongs_to :category
  has_many :comments
end

class Comment < ActiveRecord::Base
  validates :name, presence: true
  validates :body, presence: true

  belongs_to :post
end

class Category < ActiveRecord::Base
  validates :image, presence: true
  validates :title, presence: true
  validates :color, presence: true
  has_many :posts
  mount_uploader :image, ImageUploader
  mount_uploader :nav_icon, ImageUploader
end

class Admin < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password
end

class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  validates :your_email, presence: true
  validates :body, presence: true
  validates :your_name, presence: true

  attr_accessor :body, :your_email, :your_name

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
end
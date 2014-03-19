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
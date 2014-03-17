class AddNavIcon < ActiveRecord::Migration
  def change
    add_column :categories, :nav_icon, :string
  end
end

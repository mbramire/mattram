class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :image
      
      t.timestamps
    end

    add_column :posts, :category_id, :integer
  end
end

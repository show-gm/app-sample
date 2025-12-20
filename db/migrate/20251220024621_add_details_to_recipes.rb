class AddDetailsToRecipes < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :content, :text
    
  end
end

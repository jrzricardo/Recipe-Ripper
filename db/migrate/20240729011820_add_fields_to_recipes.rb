class AddFieldsToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :prep_time, :string
    add_column :recipes, :total_time, :string
  end
end

class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :url
      t.string :dish_name
      t.text :ingredients
      t.text :directions

      t.timestamps
    end
  end
end

class CreateScrapedRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :scraped_recipes do |t|
      t.boolean :saved_recipe
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end

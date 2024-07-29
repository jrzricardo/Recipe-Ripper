class CreateRecipeCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_collections do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end

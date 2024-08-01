class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :author
      t.text :ingredients
      t.text :instructions
      t.string :serving_size
      t.string :url

      t.timestamps
    end
  end
end

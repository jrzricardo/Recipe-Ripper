class CreateRecipeBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end

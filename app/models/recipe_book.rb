# == Schema Information
#
# Table name: recipe_books
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_recipe_books_on_recipe_id  (recipe_id)
#  index_recipe_books_on_user_id    (user_id)
#
# Foreign Keys
#
#  recipe_id  (recipe_id => recipes.id)
#  user_id    (user_id => users.id)
#
class RecipeBook < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  
  def self.remove_for_user(user, recipe_id)
    recipe_book = user.recipe_books.find_by(recipe_id: recipe_id)
    recipe_book&.destroy
  end 
end 

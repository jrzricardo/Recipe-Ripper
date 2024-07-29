# == Schema Information
#
# Table name: recipe_collections
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  collection_id :integer          not null
#  recipe_id     :integer          not null
#
# Indexes
#
#  index_recipe_collections_on_collection_id  (collection_id)
#  index_recipe_collections_on_recipe_id      (recipe_id)
#
# Foreign Keys
#
#  collection_id  (collection_id => collections.id)
#  recipe_id      (recipe_id => recipes.id)
#
class RecipeCollection < ApplicationRecord
  belongs_to :recipe
  belongs_to :collection
end

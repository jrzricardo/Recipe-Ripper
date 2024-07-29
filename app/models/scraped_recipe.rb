# == Schema Information
#
# Table name: scraped_recipes
#
#  id            :integer          not null, primary key
#  saved_recipe  :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  collection_id :integer          not null
#
# Indexes
#
#  index_scraped_recipes_on_collection_id  (collection_id)
#
# Foreign Keys
#
#  collection_id  (collection_id => collections.id)
#
class ScrapedRecipe < ApplicationRecord
  belongs_to :collection
end

# == Schema Information
#
# Table name: collections
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer          not null
#
# Indexes
#
#  index_collections_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  owner_id  (owner_id => owners.id)
#
class Collection < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :recipe_collections
  has_many :recipes, through: :recipe_collections
  has_many :scraped_recipes
end

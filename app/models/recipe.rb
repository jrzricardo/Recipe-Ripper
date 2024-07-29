# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  directions  :text
#  dish_name   :string
#  ingredients :text
#  prep_time   :string
#  total_time  :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_collections
  has_many :collections, through: :recipe_collections

  validates :dish_name, presence: true
  validates :source_url, presence: true, uniqueness: true
end

# == Schema Information
#
# Table name: recipes
#
#  id           :integer          not null, primary key
#  author       :string
#  ingredients  :text
#  instructions :text
#  name         :string
#  serving_size :string
#  url          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'nokogiri'
require 'httparty'
require_relative 'concerns/recipe_rippers'

class Recipe < ApplicationRecord
  include RecipeRippers
  
  attr_accessor :name, :author, :ingredients, :instructions, :serving_size, :url

  def self.rip_from_url(url)
    response = HTTParty.get(url)
    doc = Nokogiri::HTML(response.body)

    recipe = self.new
    recipe.name = recipe.rip_name(doc)
    recipe.author = recipe.rip_author(doc)
    recipe.ingredients = recipe.rip_ingredients(doc)
    recipe.instructions = recipe.rip_instructions(doc)
    recipe.serving_size = recipe.rip_serving_size(doc)
    recipe.url = url

    return recipe
  end
end

require 'nokogiri'
require 'httparty'

class Recipe < ApplicationRecord
  include RecipeRippers
  
  attr_accessor :name, :author, :ingredients, :instructions, :serving_size, :url

  def self.rip_from_url(url)
    response = HTTParty.get(url)
    doc = Nokogiri::HTML(response.body)

    recipe = self.new
    recipe.name = rip_name(doc)
    recipe.author = rip_author(doc)
    recipe.ingredients = rip_ingredients(doc)
    recipe.instructions = rip_instructions(doc)
    recipe.serving_size = rip_serving_size(doc)
    recipe.url = url

    recipe
  end
end

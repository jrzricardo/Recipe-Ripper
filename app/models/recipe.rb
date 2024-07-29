require 'nokogiri'
require 'httparty'

class Recipe
  attr_accessor :name, :ingredients, :instructions

  def self.extract_from_url(url)
    response = HTTParty.get(url)
    doc = Nokogiri::HTML(response.body)

    recipe = self.new
    recipe.name = doc.at('h1.entry-title').text.strip
    recipe.ingredients = doc.css('.wprm-recipe-ingredient').map(&:text)
    recipe.instructions = doc.css('.wprm-recipe-instruction-text').map(&:text)

    recipe
  end
end

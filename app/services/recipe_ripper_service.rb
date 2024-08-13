require_relative '../models/concerns/recipe_rippers'

class RecipeRipperService
  include RecipeRippers

  def self.rip(url)
    new(url).rip
  end

  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(HTTParty.get(url).body)
  end

  def rip
    Recipe.new(
      url: @url,
      name: rip_name(@doc),
      author: rip_author(@doc),
      ingredients: rip_ingredients(@doc).to_json,
      instructions: rip_instructions(@doc).to_json,
      serving_size: rip_serving_size(@doc)
    )
  end
end

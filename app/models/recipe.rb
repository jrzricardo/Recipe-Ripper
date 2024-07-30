require 'nokogiri'
require 'httparty'

class Recipe
  attr_accessor :name, :author, :ingredients, :instructions, :url

  def self.extract_from_url(url)
    response = HTTParty.get(url)
    doc = Nokogiri::HTML(response.body)

    recipe = self.new
    recipe.name = extract_name(doc)
    recipe.author = extract_author(doc)
    recipe.ingredients = extract_ingredients(doc)
    recipe.instructions = extract_instructions(doc)
    recipe.url = url

    recipe
  end

  private

  def self.extract_name(doc)
    selectors = [
      'h1.entry-title',
      'h1.wprm-recipe-name',
      'h1.recipe-title',
      'h1[itemprop="name"]',
      '.recipe-title h1',
      '.tasty-recipes-title',
      '.recipe-header h1',
      '.recipe-name',
      'h1.post-title',
      'h1',
    ]

    extract_text(doc, selectors, "Unknown Recipe Name")
  end

  def self.extract_author(doc)
    selectors = [
      '[itemprop="author"]',
      '.author-name',
      '.recipe-author',
      '.entry-author',
      '.byline',
      '.wprm-recipe-author',
      '.tasty-recipes-author',
      '.recipe-meta .author',
      '.post-author',
      '.author-link'
    ]

    extract_text(doc, selectors, "Unknown Author")
  end 

  def self.extract_ingredients(doc)
    selectors = [
      '.wprm-recipe-ingredient',
      '.wprm-recipe-ingredients li',
      '.ingredients-list li',
      '[itemprop="recipeIngredient"]',
      '.ingredient',
      '.tasty-recipes-ingredients li',
      '.tasty-recipes-ingredients p',
      '.recipe-ingredients li',
      '.ingredients li',
      '.ingredient-list li',
      '.ingred-list li',
      '.ingredient_list li'
    ]
    
    extract_list(doc,selectors)
  end

  def self.extract_instructions(doc)
    selectors = [
      '.wprm-recipe-instruction-text',
      '.wprm-recipe-instructions li',
      '.instructions li',
      '[itemprop="recipeInstructions"] li',
      '.instruction',
      '.tasty-recipes-instructions li',
      '.tasty-recipes-instructions p',
      '.recipe-instructions li',
      '.recipe-directions__list li',
      '.directions li',
      '.preparation li',
      '.method li'
    ]

    extract_list(doc, selectors)
  end

  def self.extract_text(doc, selectors, default)
    selectors.each do |selector|
      text = doc.at(selector)&.text&.strip
      return text if text.present?
    end
    default
  end

  def self.extract_list(doc, selectors)
    selectors.each do |selector|
      items = doc.css(selector).map(&:text).map(&:strip).reject(&:empty?)
      return items if items.any?
    end
    []
  end
end

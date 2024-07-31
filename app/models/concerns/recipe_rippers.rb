module RecipeRippers
  def rip_name(doc)
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

    rip_text(doc, selectors, "Unknown Recipe Name")
  end

  def rip_author(doc)
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

    rip_text(doc, selectors, "Unknown Author")
  end 

  def rip_ingredients(doc)
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
    
    rip_list(doc, selectors)
  end

  def rip_instructions(doc)
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

    rip_list(doc, selectors)
  end

  def rip_serving_size(doc)
    selectors = [
      '.wprm-recipe-servings',
      '.serving-size',
      '[itemprop="recipeYield"]',
      '.tasty-recipes-servings',
      '.recipe-servings',
      '.yield',
      '.recipe-yield'
    ]

    rip_text(doc, selectors, "Unknown Serving Size")
  end

  def rip_text(doc, selectors, default)
    selectors.each do |selector|
      text = doc.at(selector)&.text&.strip
      return text if text.present?
    end
    return default
  end

  def rip_list(doc, selectors)
    selectors.each do |selector|
      items = doc.css(selector).map(&:text).map(&:strip).reject(&:empty?)
      return items if items.any?
    end
    return []
  end
end

class RecipeObserver < ActiveRecord::Observer 
  def before_save(recipe)
    existing_recipe = Recipe.find_by(url: recipe.url)
    if existing_recipe
      pp "am i real?"
      recipe.errors.add(:url, "already ripped")
      throw(:abort)
    end
  end
end

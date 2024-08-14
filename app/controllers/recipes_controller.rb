class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:save]

  def index
    @recipes = Recipe.all
    render({ template: 'recipes/index' })
  end

  def show
    @recipe = Recipe.find(params[:id])
    render({ template: 'recipes/show' })
  end

  def save
    @recipe = Recipe.find(params[:id])
    current_user.recipe_books.create({ recipe: @recipe })
    redirect_to recipe_books_path, notice: 'Recipe saved to your recipe book!'
  end

  def rip
    url = params[:url]
    @recipe = Recipe.new(url: url)

    if @recipe.valid?
      @recipe = Recipe.rip_from_url(url)
      if @recipe.save
        redirect_to @recipe, notice: 'Recipe successfully ripped!'
      else
        redirect_to root_path, alert: 'Failed to save the recipe. Please try again.'
      end
    else
      redirect_to root_path, alert: 'Invalid URL. Please enter a valid recipe URL.'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :author, :ingredients, :instructions, :serving_size, :url)
  end
end

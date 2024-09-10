class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:save]

  def index
    @recipes = Recipe.page(params[:page]).per(10)
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
        existing_recipe = Recipe.find_by(url: @recipe.url)
        if existing_recipe
          redirect_to existing_recipe, alert: 'Recipe has already been ripped.'
        else
        redirect_to home_path, alert: 'Failed to save the recipe. Please try again.'
        end
      end
    else
      redirect_to home_path, alert: 'Invalid URL. Please enter a valid recipe URL.'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :author, :ingredients, :instructions, :serving_size, :url)
  end
end

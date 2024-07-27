class RecipesController < ApplicationController
  def new
  end

  def create
    scraped_data = RecipeScraper.scrape(params[:recipe][:url])
    @recipe = Recipe.new(scraped_data)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe has been ripped!'
    else
      render:new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end

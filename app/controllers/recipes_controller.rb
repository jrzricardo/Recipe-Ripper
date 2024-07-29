class RecipesController < ApplicationController
  def index
  end

  def extract
    url = params[:url]
    @recipe = Recipe.extract_from_url(url)
    render :result
  end
end

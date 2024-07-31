class RecipesController < ApplicationController
  def index
  end

  def rip
    url = params[:url]
    @recipe = Recipe.rip_from_url(url)
    render :result
  end
end

class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:save]

  def index
    @recipes = Recipe.all
    render({ :template => "recipes/index" })
  end

  def show
    @recipe = Recipe.find(params[:id])
    render({ :template => "recipes/show" })
  end

  def save
    @recipe = Recipe.find(params[:id])
    current_user.recipe_books.create({ :recipe => @recipe })
    redirect_to recipe_books_path, notice: 'Recipe saved to your recipe book!'
  end

  # def rip
  #   url = params[:url]
  #   @recipe = Recipe.rip_from_url(url)
  #   render :result
  # end
end

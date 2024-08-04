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

  def rip
    url = params[:url]
    @recipe = Recipe.rip_from_url(url)
    
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe successfully ripped!' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :author, :ingredients, :instructions, :serving_size, :url)
  end
end

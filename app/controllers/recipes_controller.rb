class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:save]

  def index
    @recipes = Recipe.all
    @temp_recipes = session[:temp_recipes] || []
    render({ :template => "recipes/index" })
  end

  def show
    @recipe = Recipe.find_by(id: params[:id]) || 
              (session[:temp_recipes] || []).find { |r| r['id'] == params[:id] } ||
              Recipe.new(session[:temp_recipe])
    render({ :template => "recipes/show" })
  end

  def save
    @recipe = Recipe.find_by(id: params[:id]) || Recipe.new(session[:temp_recipe])
    
    if @recipe.new_record?
      @recipe.save
    end

    current_user.recipe_books.create({ :recipe => @recipe })
    session.delete(:temp_recipe)
    remove_temp_recipe(@recipe)
    redirect_to recipe_books_path, notice: 'Recipe saved to your recipe book!'
  end

  def rip
    url = params[:url]
    @recipe = Recipe.rip_from_url(url)
    
    if @recipe.valid?
      @recipe.id = SecureRandom.uuid # Assign a temporary ID
      session[:temp_recipe] = @recipe.attributes
      add_temp_recipe(@recipe.attributes)
      redirect_to recipe_path(@recipe.id), notice: 'Recipe successfully ripped!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :author, :ingredients, :instructions, :serving_size, :url)
  end

  def add_temp_recipe(recipe)
    session[:temp_recipes] ||= []
    session[:temp_recipes] << recipe
  end

  def remove_temp_recipe(recipe)
    session[:temp_recipes]&.delete_if { |r| r['id'] == recipe.id }
  end
end

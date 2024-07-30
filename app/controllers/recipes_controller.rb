class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :save]

  def index
    @recipes = current_user.recipes if user_signed_in?
  end

  def show
    @recipe ||= Recipe.new(session[:extracted_recipe]) if session[:extracted_recipe]
  end

  def new
    @recipe = Recipe.new
  end

  def extract
    url = params[:url]
    extracted_recipe = Recipe.extract_from_url(url)
    session[:extracted_recipe] = extracted_recipe.as_json
    redirect_to recipe_path(id: 'new')
  end

  def save
    if @recipe.persisted?
      redirect_to @recipe, notice: 'Recipe already saved.'
    else
      @recipe = current_user.recipes.build(session[:extracted_recipe])
      if @recipe.save
        session.delete(:extracted_recipe)
        redirect_to @recipe, notice: 'Recipe was successfully saved.'
      else
        render :show
      end
    end
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  

  private

  def set_recipe
    @recipe = Recipe.find(params[:id]) if params[:id] != 'new'
  end

  def recipe_params
    params.require(:recipe).permit(:name, :author, ingredients: [], instructions: [])
  end
end

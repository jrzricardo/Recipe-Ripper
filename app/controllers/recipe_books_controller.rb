class RecipeBooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes.page(params[:page]).per(10)
    render 'index'
  end

  def delete
    # Comment: Could these Queries be done on the model?
    recipe_book = current_user.recipe_books.find_by(recipe_id: params[:id])
    if recipe_book&.destroy
      redirect_to recipe_books_path, notice: 'Recipe removed from your recipe book.'
    else
      redirect_to recipe_books_path, alert: 'Unable to remove recipe from your recipe book.'
    end
  end
end

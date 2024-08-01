class RecipeBooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
    render({ :template => "recipe_books/index" })
  end
end

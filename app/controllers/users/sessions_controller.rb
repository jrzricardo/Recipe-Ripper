class Users::SessionsController < Devise::SessionsController
  def create
    super do |resource|
      if params[:recipe_id].present?
        recipe = Recipe.find_by(id: params[:recipe_id])
        if recipe
          resource.recipe_books.create(recipe: recipe)
          redirect_to recipe_books_path and return
        end
      end
    end
  end
end

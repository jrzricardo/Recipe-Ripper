class ApplicationController < ActionController::Base
  skip_forgery_protection

  protected
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || recipe_books_path
  end
end

class FavoritesController < ApplicationController
  before_action :require_login

  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.favorites.create(recipe: @recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.find_by(recipe: @recipe)
    favorite.destroy if favorite
  end

  private

  def require_login
    unless user_signed_in?
      redirect_to recipes_path
    end
  end
end

  
  
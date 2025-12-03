class RecipesController < ApplicationController
  def index
    # データベースからすべてのレシピを取得
    @recipes = Recipe.all
  end

  def new
  
    @recipe = Recipe.new
  end

  def create
    
    @recipe = Recipe.new(recipe_params)


    if @recipe = Recipe.new(recipe_params)
      redirect_to recipes_path, notice: "レシピを投稿しました！"
    else
      render :new, status: :unprocessable_entity
    end  
  end

  def recipe_params

    params.require(:recipe).permit(:title, :ingredients, :instructions)
  end  
end

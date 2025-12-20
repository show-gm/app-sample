# app/controllers/recipes_controller.rb

class RecipesController < ApplicationController
  # ログインユーザーのみアクセス可能
  before_action :authenticate_user!, only: [:new, :create] 
  
  def index
    # データベースからすべてのレシピを取得
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end
  
  def create
    # 正しいロジック：インスタンス作成後、saveを試みる
    # レシピ作成者（current_user）を紐づける処理を追加しても良いですが、今回はシンプルに保存のみを実装します。
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      # 保存に成功したら一覧画面へリダイレクト
      redirect_to recipes_path, notice: 'レシピを投稿しました。' 
    else
      # 保存に失敗したらフォームを再表示
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def recipe_params
    # DBカラム名（:content）に合わせて修正。以前の誤った :ingredients, :instructions を修正します。
    params.require(:recipe).permit(:title, :content) 
  end
end
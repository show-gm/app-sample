require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "未ログインでお気に入り登録をすると、一覧へ移動する" do
    post recipe_favorite_path(1)
    assert_redirected_to recipes_path
  end

  test "ログイン済みでお気に入り登録をすると、お気に入りが1件増える" do
    sign_in users(:one)

    assert_difference("Favorite.count", 1) do
      post recipe_favorite_path(recipes(:one))
    end
  end
  test "ログイン済みでお気に入りを解除すると、お気に入りが1件減る" do
    sign_in users(:one)
  
    assert_difference("Favorite.count", -1) do
      delete recipe_favorite_path(recipes(:one))
    end
  end
end

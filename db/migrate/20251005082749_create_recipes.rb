class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      # レシピに必要な主要なデータ項目
      t.string :title, null: false      # レシピタイトル（文字列、必須）
      t.text :description              # レシピの説明・手順（長いテキスト）　
      t.string :image                  # 画像ファイル名（画像アップロード機能用）　

      # 誰が投稿したかを示す外部キー (user.rbと関連付ける)
      t.references :user, foreign_key: true, null: false 

      t.timestamps                     # 作成日時 (created_at)と更新日時 (updated_at)
  
    end
  end
end

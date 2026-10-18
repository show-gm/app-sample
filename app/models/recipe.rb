class Recipe < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    validates :title, presence: true
    validates :content, presence: true
    has_many :favorites, dependent: :destroy
    def favorited_by?(user)
      favorites.exists?(user_id: user.id)
    end
end

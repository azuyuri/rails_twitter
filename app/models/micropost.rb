class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) } # 13.17
  mount_uploader :picture, PictureUploader #13.59
  validates :user_id, presence: true # 13.5
  validates :content, presence: true, length: { maximum: 140 } # 13.8
  validate  :picture_size # 13.65

  private

  # アップロードされた画像のサイズをバリデーションする 13.65
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
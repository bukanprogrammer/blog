class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one_attached :image

  has_many :articles, -> { where publish: :y }, dependent: :destroy

  validates :name, presence: true
  validate :correct_image_type

  private
  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/jpg image/png))
      errors.add(:image, 'Harus jpg atau png')
    elsif image.attached? == false
      errors.add(:image, 'Harus ada')
    end
  end
end

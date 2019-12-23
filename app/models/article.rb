class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :image_feature, ImageFeatureUploader

  belongs_to :category

  belongs_to :user

  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {minimum: 100}
  validates :image_feature, presence: true
  validates :slug, presence: true

  acts_as_punchable

end

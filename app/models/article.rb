class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :image_feature, ImageFeatureUploader

  belongs_to :category, counter_cache: true

  validates :title, presence: true, length: {maximum: 25}
  validates :content, presence: true, length: {minimum: 100}
  validates :image_feature, presence: true
  validates :slug, presence: true

  enum publish: {ya: 'y', tidak: 'n'}
end

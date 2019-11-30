class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :image_feature, ImageFeatureUploader

  has_many :articles

  validates :name, presence: true
  validates :image_feature, presence: true
end

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :image_feature, ImageFeatureUploader

  has_many :articles, -> { where publish: :y }, dependent: :destroy

  validates :name, presence: true
  validates :image_feature, presence: true
end

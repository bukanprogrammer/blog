class Article < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  mount_uploader :image_feature, ImageFeatureUploader

  belongs_to :category, counter_cache: true
end

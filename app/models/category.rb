class Category < ApplicationRecord
  mount_uploader :image_feature, ImageFeatureUploader

  has_many :articles
end

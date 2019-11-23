class Article < ApplicationRecord
  mount_uploader :image_feature, ImageFeatureUploader

  belongs_to :category
end

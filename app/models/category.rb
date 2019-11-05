class Category < ApplicationRecord
  mount_uploader :image_feature, ImageFeatureUploader
end

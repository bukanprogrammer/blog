class RemoveColumnImageFeatureFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :image_feature
  end
end

class ChangeColumnToNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :articles, :title, false
    change_column_null :articles, :content, false
    change_column_null :articles, :image_feature, false
    change_column_null :articles, :category_id, false
    change_column_null :articles, :slug, false
    change_column_null :categories, :name, false
    change_column_null :categories, :image_feature, false
    change_column_null :categories, :slug, false
    change_column_null :subscribers, :email, false
  end
end

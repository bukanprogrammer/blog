class DropColumnCountArticleFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :articles_count
  end
end

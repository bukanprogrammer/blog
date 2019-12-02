class AddColumnUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :user_id, :integer, null: false
  end
end

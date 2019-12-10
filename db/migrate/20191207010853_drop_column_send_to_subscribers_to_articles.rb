class DropColumnSendToSubscribersToArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :send_to_subscribers
  end
end

class AddColumnSendToAllSubscriber < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      ALTER TABLE articles ADD COLUMN send_to_subscribers ENUM('y', 'n') NOT NULL DEFAULT 'n';
    SQL
  end

  def down
    remove_column :articles, :send_to_subscribers
  end
end

class AddColumnSentToSubscribers < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      ALTER TABLE articles ADD COLUMN sent_to_subscribers ENUM('y', 'n') NOT NULL DEFAULT 'n';
    SQL
  end

  def down
    remove_column :articles, :sent_to_subscribers
  end
end

class AddColumnPublishToArticles < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      ALTER TABLE articles ADD COLUMN publish ENUM('y', 'n') NOT NULL DEFAULT 'n';
    SQL
  end

  def down
    remove_column :articles, :publish
  end
end

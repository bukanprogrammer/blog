class AddColumnDescriptionToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :description, :text, default: 'Tutorial menarik seputar programming - BukanProgrammer.com'
  end
end

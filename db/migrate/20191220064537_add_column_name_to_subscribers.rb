class AddColumnNameToSubscribers < ActiveRecord::Migration[6.1]
  def change
    add_column :subscribers, :name, :string
  end
end

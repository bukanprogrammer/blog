class AddColumnArticlesCountToCategories < ActiveRecord::Migration[6.1]
  def up
    add_column :categories, :articles_count, :integer

    Category.all.each do |t|
      Category.reset_counters(t.id, :articles)
    end
  end

  def down
    remove_column :categories, :articles_count
  end
end

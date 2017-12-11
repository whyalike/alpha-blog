class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    # Article table, description and type
    add_column :articles, :description, :text
    add_column :articles, :create_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end

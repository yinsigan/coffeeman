class AddEditedAtToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :edited_at, :timestamp
  end
end

class AddActivedAtToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :actived_at, :timestamp
  end
end

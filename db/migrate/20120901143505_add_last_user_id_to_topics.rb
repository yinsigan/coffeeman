class AddLastUserIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :last_user_id, :integer
  end
end

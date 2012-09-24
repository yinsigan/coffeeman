class AddRepliesCountToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :replies_count, :integer, :default => 0

    Topic.reset_column_information

    Topic.all.each do |p|
      p.update_attributes(:replies_count => p.replies.length)
    end
  end
end

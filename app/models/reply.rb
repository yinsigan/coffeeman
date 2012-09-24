class Reply < ActiveRecord::Base
  attr_accessible :content, :topic_id, :user_id
  belongs_to :user
  belongs_to :topic, :counter_cache => true

  validates_presence_of :content

  after_create :update_topic

  def anchor
    user.username
  end

  def edited?
    updated_at > created_at
  end

  def update_topic
    topic.update_reply_stats_by(self)
  end

end

# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


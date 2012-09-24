class Tagging < ActiveRecord::Base
  attr_accessible :tag_id, :topic_id
  belongs_to :tag
  belongs_to :topic
end

# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  topic_id   :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


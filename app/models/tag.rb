class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings
  has_many :topics, :through => :taggings
end

# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


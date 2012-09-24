class Profile < ActiveRecord::Base
  attr_accessible :company, :description, :github, :name, :twitter, :user_id, :website, :avatar
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
end

# == Schema Information
#
# Table name: profiles
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  twitter     :string(255)
#  github      :string(255)
#  website     :string(255)
#  company     :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  avatar      :string(255)
#


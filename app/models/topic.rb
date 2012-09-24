class Topic < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :tag_string, :edited_at, :replies_count, :actived_at, :last_user_id
  validates :title, :presence => true, :length => { :in => 5..50 }, :uniqueness => true
  belongs_to :user
  belongs_to :last_reply_user, :class_name => "User", :foreign_key => "last_user_id"
  has_many :taggings
  has_many :replies, :dependent => :destroy
  has_many :tags, :through => :taggings

  before_create :set_actived_at

  scope :tag_with, lambda{ |tag_name| joins(:tags).where("tags.name = ?", tag_name) }
  scope :active, order("actived_at desc")

  def tag_string=(string)
    if self.tags.any?
      self.tags.delete_all
      string.to_s.downcase.split(/[,\s]+/).uniq.each { |tag| self.tags << Tag.find_or_create_by_name(tag)}
    else
      string.to_s.downcase.split(/[,\s]+/).uniq.each { |tag| self.tags << Tag.find_or_create_by_name(tag)}
    end
  end

  def tag_string
    self.tags.map(&:name).join(', ')
  end

  def edited?
    edited_at.present?
  end
  def set_edited_at
    self.edited_at = Time.now.utc
  end

  def last_page
    page = (replies_count.to_f / self.class.default_per_page).ceil
    page > 1 ? page : nil
  end

  def set_actived_at
    self.actived_at = Time.now.utc
  end

  def update_reply_stats_by(reply)
    self.actived_at = reply.created_at
    self.last_user_id = reply.user.id
    save
  end

end

# == Schema Information
#
# Table name: topics
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  content       :text
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  edited_at     :datetime
#  replies_count :integer          default(0)
#


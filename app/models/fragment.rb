class Fragment < ActiveRecord::Base
  attr_accessible :footer, :home_mainbar_bottom, :home_sidebar_bottom, :site_id, :topics_sidebar_bottom

  belongs_to :site

  FIELDS = %w(home_mainbar_bottom home_sidebar_bottom topics_sidebar_bottom footer)
end

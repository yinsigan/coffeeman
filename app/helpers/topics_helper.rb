module TopicsHelper
  def subscribe_url
    case action_name
    when 'index', 'newest'
      newest_topics_url(:format => :rss)
    end
  end
end

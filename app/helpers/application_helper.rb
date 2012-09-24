module ApplicationHelper
  def page_title
    if @page_title
      "#{@page_title} - #{@site.name}"
    else
      "#{@site.name}"
    end
  end

  def gravatar_for(user, size=128)
    if !!user.profile && user.profile.avatar.present? 
      image_tag user.profile.avatar_url(:small)
    else
      #gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      #image_tag(gravatar_url, alt: user.username, class: "gravatar")
      image_tag user.gravatar_url(:size => size)
    end
  end

  def markdown(text)
    Redcarpet::Markdown.new( Redcarpet::Render::HTML.new(:hard_wrap => true, :no_styles => true),
      :autolink => true, :no_intra_emphasis => true).render(text).html_safe
  end

  def link_to_person(user)
    link_to user.username, user_path(user)
  end

  def format_time(time)
    timeago_tag time, :limit => 20.days.ago
  end

end

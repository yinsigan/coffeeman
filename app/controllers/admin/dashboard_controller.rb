class Admin::DashboardController < Admin::BaseController
  def show
    @topics = Topic.order("created_at desc").limit(5)
    @topics_today_count = Topic.where("created_at > ?", Date.today).count
    @topics_total_count = Topic.count

    @replies = Reply.order("created_at desc").limit(5)
    @replies_today_count = Reply.where("created_at > ?", Date.today).count
    @replies_total_count = Reply.count

    @users = User.order("created_at desc").limit(5)
    @users_today_count = User.where("created_at > ?", Date.today).count
    @users_total_count = User.count
  end
end

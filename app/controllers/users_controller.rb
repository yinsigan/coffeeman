class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @topics_count = @user.topics.count
    @replies_count = @user.replies.count
    @topics = @user.topics.order("created_at desc").page(1).per(10)
  end
end

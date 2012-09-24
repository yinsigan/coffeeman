class TopicsController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :create, :update]
  before_filter :correct_user,   only: [:edit, :update]

  def index
    @topics = Topic.active.page(params[:page]).per(10)
  end

  def newest
    respond_to do |format|
      format.html do
        @topics = Topic.order("created_at desc").page(params[:page])
        render :index
      end

      format.rss do
        @topics = Topic.order("created_at desc").limit(20)
        @page_title = I18n.t('newest_topics_title', :site_name => @site.name)
        render :index, :layout => false
      end

    end
  end

  def my
    @topics = current_user.topics.active.page(params[:page])
    render :index
  end

  def show
    @topic = Topic.find(params[:id])
    @replies = @topic.replies.page(params[:page])
    if user_signed_in?
      @reply = current_user.replies.new
    end
  end

  def new
    @topic = current_user.topics.build
  end

  def edit
    @topic = current_user.topics.find(params[:id])
  end

  def create
    @topic = current_user.topics.build(params[:topic])

    if @topic.save
      redirect_to @topic
    else
      render action: "new"
    end
  end

  def update
    @topic = current_user.topics.find(params[:id])
    @topic.set_edited_at

    if @topic.update_attributes(params[:topic])
      redirect_to @topic
    else
      render action: "edit"
    end
  end

  private

   def correct_user
     @topic = current_user.topics.find_by_id(params[:id])
     redirect_to root_url if @topic.nil?
   end


end

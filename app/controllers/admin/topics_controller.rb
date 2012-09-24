class Admin::TopicsController < Admin::BaseController
  def index
    @topics = Topic.order("created_at desc").page(params[:page]).per(10)
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    flash[:success] = I18n.t('admin.topics.destroy.delete_success', :title => @topic.title)
    redirect_to :action => :index
  end
end

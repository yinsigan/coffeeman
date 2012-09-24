class Admin::RepliesController < Admin::BaseController
  def index
    @replies = Reply.order("created_at desc").page(params[:page])
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    flash[:success] = I18n.t('admin.replies.destroy.delete_success')
    redirect_to :action => :index
  end
end

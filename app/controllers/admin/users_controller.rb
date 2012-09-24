class Admin::UsersController < Admin::BaseController
  def index
    @users = User.order("created_at desc").page(params[:page]).per(10)
  end
  def show
    @user = User.find(params[:id])
    @topics = @user.topics.order("created_at desc").page(1).per(5)
    @replies = @user.replies.order("created_at desc").page(1).per(5)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = I18n.t('admin.users.destroy.delete_success', :name => @user.username)
    redirect_to :action => :index
  end
end

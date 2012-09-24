class Settings::ProfilesController < ApplicationController
  layout "settings"
  def show
    @profile = current_user.profile
  end

  def update
    if current_user.profile.update_attributes params[:profile]
      flash[:success] = 'Successful Update.'
      redirect_to :action => :show
    else
      render :show
    end
  end
end

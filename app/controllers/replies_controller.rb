class RepliesController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :edit, :new, :destroy]


  def new
    @reply = Reply.new
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def create
    @reply = current_user.replies.new(params[:reply])
    @topic = Topic.find(params[:topic_id])
    @reply.topic = @topic

    respond_to do |format|
      if @reply.save
        format.html { redirect_to topic_url(@topic, :page => @topic.last_page) }
        format.js { render :layout => false }
      else
        format.html { render action: "new" }
        format.js { render :layout => false }
      end
    end
  end

  def update
    @reply = Reply.find(params[:id])

    respond_to do |format|
      if @reply.update_attributes(params[:reply])
        format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

end

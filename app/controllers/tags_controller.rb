class TagsController < ApplicationController
  def show
    @topics = Tag.find(params[:id]).topics
  end
end

class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
    @event = Event.find(params[:event_id])
  	@comment = @event.comments.build(comment_params)
    @comment_items = @event.comments
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @event }
        format.js
      end
    else
      redirect_to @users
    end
  end

  def destroy
  end

  def upvote
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:id])
    @comment_items = @event.comments
    @comment.liked_by current_user
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  def unupvote
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:id])
    @comment_items = @event.comments
    @comment.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  def downvote
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:id])
    @comment_items = @event.comments
    @comment.downvote_from current_user
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  def undownvote
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:id])
    @comment_items = @event.comments
    @comment.undisliked_by current_user
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:like, :comment_content, :user_id, :event_id)
    end

    def find_event
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
    end
end
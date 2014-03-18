class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
    @event = Event.find(params[:event_id])
  	@comment = @event.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to @event
    else
      @comment_items = []
      render 'events/show'
    end
  end

  def destroy
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
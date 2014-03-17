class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
  	@comment = current_user.commentables.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to event_path(event)
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:comment_content)
    end
end
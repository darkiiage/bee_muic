class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end


  def feed
    if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

end

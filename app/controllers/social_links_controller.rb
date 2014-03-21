class SocialLinksController < ApplicationController
  def index
  	@social_link = SocialLink.new;
    @social_link_items = SocialLink.all;
  end

  def create
  	@social_link = SocialLink.new(social_link_params)
    if @social_link.save
      flash[:success] = "Event Type created"
      redirect_to social_links_path
    else
      @social_link_items = []
      render 'index'
    end
  end

  def edit
  end

  def destroy
    SocialLink.find(params[:id]).destroy
    flash[:success] = "Faculty deleted."
    redirect_to social_links_path
  end

  private
  	def social_link_params
      params.require(:social_link).permit(:social_name,:social_image)
    end

end
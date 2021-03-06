
class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  
  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.events.select { |event| event.start_date > Time.now.beginning_of_day() }
    @past_events = @user.events.select { |event| event.start_date < Time.now.beginning_of_day() }
  end


  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.update_attributes(description: "I'm a bee! I love sharing!")
      sign_in @user
      flash[:success] = "Welcome to bee MU!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_edit_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:first_name,:last_name, :email, :password,
                                   :password_confirmation)
    end

    def user_edit_params
      params.require(:user).permit(:first_name,:last_name, :email, :password,
                                   :password_confirmation, :description, :faculty, :phone, :user_image)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end


end

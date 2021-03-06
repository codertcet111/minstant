class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user  = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  def get_followers
    current_user.followers
  end

  def get_followings
    current_user.following
  end

  def save_follow
    f1 = Follow.create(user_id: current_user.id, following_id: params['format'])
    f1.save
    redirect_to user_path(User.find(params['format']))
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :website,
                                 :bio, :email, :phone, :gender, :avatar)
  end
end

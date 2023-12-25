class Public::UsersController < ApplicationController

  before_action :ensure_user, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:favorites]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def check
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    #@post = Post.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :is_active, :profile_image)
  end

  def ensure_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  def set_user
    @user = User.find(params[:id])
  end





end

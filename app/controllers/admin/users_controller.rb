class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render edit_admin_user_path(@customer.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :is_active, :profile_image)
  end

end

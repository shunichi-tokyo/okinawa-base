# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]

  def after_sign_in_path_for(resource)
    flash[:notice] = "ようこそ"
    user_path(@user.id)
  end

  def after_sign_out_path_for(resource)
    #flash[:notice] = "Signed out successfully."
    root_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def customer_state
      # 【処理内容1】 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
      # アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
      # 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
      if @user.valid_password?(params[:user][:password])
        # 【処理内容3】
        unless @user.is_active
          redirect_to new_user_registration_path
        end
      end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]
  before_action :configure_permitted_parameters, only: [:create]
  

  def after_sign_in_path_for(resource)
    #flash[:notice] = "Signed in successfully."
    admin_posts_path
  end

  def after_sign_out_path_for(resource)
    #flash[:notice] = "Signed out successfully."
     new_admin_session_path
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

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end

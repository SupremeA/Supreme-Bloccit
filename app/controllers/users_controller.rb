class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User Information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:title, :body, :image)
   end
 end
end

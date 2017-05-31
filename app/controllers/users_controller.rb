class UsersController < ApplicationController
 before_action :require_login

  def index
  	@users = current_user
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
  	@user.update_attributes(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], profilepic: params[:user][:profilepic] )
    redirect_to root_path
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :profilepic)
    end
end

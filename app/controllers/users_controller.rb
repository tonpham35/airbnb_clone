class UsersController < ApplicationController
 before_action :require_login

  def home
    @listings = Listing.all
    @listings = @listings.sample(16)
    @users = current_user
  end  

  def index
  	@users = current_user
  end

  def edit
  	@users = current_user
  end

  def update
  	@users = current_user
  	@users.update_attributes(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], profilepic: params[:user][:profilepic] )
    redirect_to root_path
  end

   def show
    @users = User.find(params[:id])
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :profilepic)
    end
end

class UsersController < ApplicationController
 before_action :require_login, only: [:edit, :update, :destroy, :index]
  def home
    @listings = Listing.all
    @listings = @listings.sample(16)
    @users = current_user
  end  

  def index
  	@users = current_user
  end

  def edit
    if current_user == User.find(params[:id])
  	   @user = current_user
    else
      redirect_to root_path
    end
  end

  def update
    if current_user == User.find(params[:id])
    	@users = current_user
    	@users.update_attributes(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], profilepic: params[:user][:profilepic] )
      redirect_to root_path
    else
      redirect_to root_path
    end 
  end

   def show
    @users = User.find(params[:id])
  end

  def destroy
    if current_user == User.find(params[:id])  
      @users.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :profilepic)
    end
end

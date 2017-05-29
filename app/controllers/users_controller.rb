class UsersController < ApplicationController
 before_action :require_login

  def index
  	@users = current_user
  end

end
	
class UsersController < ApplicationController
  def show
	@user = User.find_by(username: params[:username])  	
	unless @user
		redirect_to root_path, notice: "User not found"
  	end	
  end
end

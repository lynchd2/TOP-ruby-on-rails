class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "You have successfully been added to the part-a!"
  		redirect_to @user
  	else
  		render :new
  		flash.now[:error] = "Please try again"
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name)
  end

end

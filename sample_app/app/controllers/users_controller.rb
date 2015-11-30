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
  		flash[:success] = "WELCOME TO THE SAMPLE APP!!!1!"
  		redirect_to @user
  	else
  		flash.now[:error] = "INVALID!"
  		render :new
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

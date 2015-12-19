class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(name: params[:session][:name])
  	if user
  		log_in(user)
  		flash[:success] = "Welcome to the part-a!"
  		redirect_to user
  	else
  		render 'new'
  		flash.now[:error] = "That name does not exist in the private party."
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end

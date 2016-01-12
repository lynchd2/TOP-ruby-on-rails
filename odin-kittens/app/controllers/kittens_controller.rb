class KittensController < ApplicationController

	def new
		@kitten = Kitten.new
	end

	def edit
		@kitten = Kitten.find_by(id: params[:id])
	end

	def create
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
			redirect_to action: "index"
			flash.notice = "Your kitten has been created!"
		end
	end

	def index
		@kittens = Kitten.all
	end

	def destroy
		@kitten = Kitten.find_by(id: params[:id])
		@kitten.destroy
		flash.notice = "Your kitten has been deleted!"
		redirect_to action: "index"

	end

	def edit
		@kitten = Kitten.find_by(id: params[:id])
	end

	def show
		@kitten = Kitten.find_by(id: params[:id])
	end

	def update
		@kitten = Kitten.find_by(id: params[:id])
		@kitten.update(kitten_params)
		flash.notice = "Your kitten has been updated!"
		if @kitten.save
			redirect_to action: "index"
		end
	end




	private

	def kitten_params
		params.require(:kitten).permit(:name, :age, :softness, :cuteness)
	end
end

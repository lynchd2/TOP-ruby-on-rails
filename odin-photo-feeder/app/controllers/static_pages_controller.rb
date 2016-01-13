class StaticPagesController < ApplicationController

	before_action :set_flickr
	
	def home
		@user = User.new
		@flickr_id = params[:flickr_id]
	end

	private

	def set_flickr
		FlickRaw.api_key = ENV["API_KEY"]
		FlickRaw.shared_secret = ENV["SHARED_SECRET"]
	end
end


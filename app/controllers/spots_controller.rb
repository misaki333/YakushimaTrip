class SpotsController < ApplicationController
	def index
		@random = Spot.order("RANDOM()").limit(5)
		@spots = Spot.all
	end

	def show
		@spot = Spot.find(params[:id])
		@posts = Post.where(spot_id: @spot.id)
    post_images = PostImage.joins(:@post).where(post_id: {spot_id: @spot.id})
	end
end
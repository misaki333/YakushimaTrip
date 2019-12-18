class SpotsController < ApplicationController
	def index
		@random = Spot.order("RANDOM()").limit(4)
		@spots = Spot.all
	end

	def show
		@spot = Spot.find(params[:id])
		@posts = Post.where(spot_id: @spot.id)
	end
end
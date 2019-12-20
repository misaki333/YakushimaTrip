class Admin::SpotsController < ApplicationController
	def new
		@spot = Spot.new
	end

	def create
		@category = Category.find(params[:spot][:category_id])
		@spot = Spot.new(spot_params)
		@spot.category_id = @category.id
		if @spot.save
			redirect_to new_admin_spot_path
		else
			render 'new'
		end
	end

	def edit
		@spot = Spot.find(params[:id])
	end

	def update
		@category = Category.find_by(name: params[:spot][:category_id])
		@spot = Spot.find(params[:id])
		@spot.category_id = @category.id
		if @spot.update(spot_params)
			redirect_to admin_spot_path(params[:id])
		else
			render 'edit'
		end
	end

	def destroy
		@spot = Spot.find(params[:id])
		@spot.destroy
		redirect_to admin_spots_path
	end

	def index
		@spots = Spot.all
	end

	def show
		@spot = Spot.find(params[:id])
	end

	private
	def spot_params
		params.require(:spot).permit(:name, :address, :image, :content, :latitude, :longitude)
	end
end

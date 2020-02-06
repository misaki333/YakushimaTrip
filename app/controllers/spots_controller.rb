class SpotsController < ApplicationController
  def index
    if Rails.env.producion?
      @random = Spot.order("RAND()").limit(6)
    else
      @random = Spot.order("RANDOM()").limit(6)
    end
    @spots = Spot.all
    @categories = Category.all
  end

  def show
    @spot = Spot.find(params[:id])
    @posts = Post.where(spot_id: @spot.id)
    post_images = PostImage.joins(:@post).where(post_id: {spot_id: @spot.id})
  end
end
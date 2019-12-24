class PostsController < ApplicationController
	before_action :authenticate_user!

  def spots_select
    if request.xhr?
      render partial: 'posts/spots', locals: {category_id: params[:category_id]}
    end
  end

	def new
		@spot = Spot.find(params[:id])
		@post = Post.new
		@post_image = @post.post_images.build
		@post.spot_id = @spot.id
	end

  def news
    @post = Post.new
    @spot = @post.spot
    @post_image = @post.post_images.build
  end

	def create
		if @spot != nil
			@spot = Spot.find(params[:post][:spot_id])
			@post = Post.new(post_params)
		else
			@post = Post.new(post_params)
			@spot = @post.spot
		end
		@post.user_id = current_user.id
		if @post.save
  		redirect_to root_path
		end
	end

	def show
		@post = Post.find(params[:id])
		@post_images = PostImage.where(post_id: @post.id)
	end

	def edit
		@post = Post.find(params[:id])
		@post_images = PostImage.where(post_id: @post.id)
	end

	def update
		@spot = Spot.find_by(name: params[:post][:spot_id])
		@post = Post.find(params[:id])
		@post.spot_id = @spot.id
		if @post.update(post_params)
			redirect_to post_path(@post.id)
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to mypage_path(current_user.id)
	end

	private
	def post_params
		params.require(:post).permit(:impression, :visit_date, :spot_id,
			post_images_attributes: [:id, :image, :_destroy])
	end
end
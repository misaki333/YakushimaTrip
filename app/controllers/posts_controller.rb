class PostsController < ApplicationController
	def new
		@post = Post.new
		@post_image = @post.post_images.build
	end

	def autocomplete_spot
		spot_suggestions = Spot.autocomplete(params[:term]).pluck(:name)
		respond_to do |format|
			format.html
			format.json{
				render json: spot_suggestions
			}
		end
	end

	def create
		@spot = Spot.find_by(name: params[:post][:spot_id])
		@post = Post.new(post_params)
		@post.spot_id = @spot.id
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
		params.require(:post).permit(:impression, :visit_date,
			post_images_attributes: [:id, :image, :_destroy])
	end
end
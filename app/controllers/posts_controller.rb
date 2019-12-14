class PostsController < ApplicationController
	def new
		@post = Post.new
		@post_image = @post.post_images.build
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
  		redirect_to root_path
		end
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

	def show
		@post = Post.find(params[:id])
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def post_params
		params.require(:post).permit(:impression, :visit_date,
			post_images_attributes: [:id, :image, :_destroy])
	end

end

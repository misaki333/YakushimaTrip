class PostsController < ApplicationController
	def new
		@post = Post.new
		@post.post_images.build
	end

	def create
		post = Post.new(post_params)
		#post = Post.new(params)
   		#binding.pry
		#params[:post_images_attributes][:"0"][:image].each do |image|
		params[:post][:post_images_attributes]["0"][:image].each do |image|
			next if image.class == String
			post.post_images.build(image: image)
		end

		if post.save
  		redirect_to root_path
		else
   		binding.pry
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
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def post_params
		params.require(:post).permit(:impression, :visit_date)
	end

end

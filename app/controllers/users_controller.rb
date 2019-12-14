class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@posts = @user.posts
		@post_images = Postimage.where(post_id: @post.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		if user.update(user_params)
			redirect_to mypage_path
		else
			render "edit"
		end
	end

	def destroy
	end

	def mypage
		@user = User.find(params[:id])
	end

	def exit
		@user = User.find(parmas[:id])
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end
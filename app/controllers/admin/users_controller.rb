class Admin::UsersController < ApplicationController
	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'index'
    end
  end

	def destroy
		@user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit(:id, :name, :email)
  end
end

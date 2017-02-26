class UsersController < ApplicationController

	def index
		@users = User.all
		@user = current_user

	end
	
	def new
		@user = User.new(email: params[:email])
	end

	def create
		@user = User.new user_params
		if @user.save
			flash[:success] = "Welcome back #{@user.name}"
			session[:user_id] = @user.id
			redirect_to root_path
		else
			render 'new'		
		end
	end

	def inbox
		
	end

	
	def show
		@user = current_user
	end

	private

	def user_params
		params.require(:user).permit(:email, :name, :password)
	end


end

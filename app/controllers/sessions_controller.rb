class SessionsController < ApplicationController
  def new

  end

  def create
  	@user = User.find_by(email: params[:email])
  	if @user
  		if @user.authenticate(params[:password])
  			flash[:success] = "Sign In successfully"
  			session[:user_id] = @user.id
  			redirect_to root_path
  		else
  			flash.now[:error] = "Wrong password"
  			render 'new'
  		end
	else
  		flash.now[:error] = "user not found"	
  		render 'new'
  	end

  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, flash: {success: "Logged out"}
  end


end

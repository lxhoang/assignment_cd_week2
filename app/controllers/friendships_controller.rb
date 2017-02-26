class FriendshipsController < ApplicationController
	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
			flash[:notice] = "Added friend"
			redirect_to root_path
		else
			flash[:error] = "Error when adding friend"
			redirect_to root_path
		end
	end

	def destroy
		@friendship = current_user.friendships.find(params[:id])
		@friendship.destroy
		flash[:notice] = "Successfully destroyed friendship"
		redirect_to root_path
	end
end

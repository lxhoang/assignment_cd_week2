class MessagesController < ApplicationController

	def index
		load_user
	end

	def show
		@message = Message.where(recipient: current_user).find params[:id]
		unless @message.read?
			@message.mark_as_read!
		end
	end

	def sent
		load_user
		@messages = @user.sent_messages
	end

	def received
		load_user
		@messages = @user.received_messages
	end

	def new
		@message = Message.new
		@users = User.all
	end

	def create
	    @message = Message.new message_params
	    @message.sender = current_user
	    if @message.save
			redirect_to root_path
	    else
	      redirect_to root_path
	    end
  end

	def load_user
		if params[:user_id]
		@user = User.find params[:user_id]
	else
		@user = current_user
		end
	end

	private

	def message_params
		params.require(:message).permit(:recipient_id, :body, :subject)
	end

end

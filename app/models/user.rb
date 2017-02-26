class User < ApplicationRecord

	has_secure_password

	has_many :friendships
	has_many :friends, :through => :friendships
	# has_many :inverse_friendships, class_name: "Friendship", :foreign_key => "friend_id"
	# has_many :inverse_friends, :through -> :inverse_friendships, :source => :user

	validates :email, uniqueness: true, presence: true

	def to_s
		email
	end

	def received_messages
		Message.where(recipient_id: self.id).order('created_at DESC')
	end

	def sent_messages
		Message.where(sender_id: self.id).order('created_at DESC')
	end

	def latest_received_messages(n)
		received_messages.order(created_at: :desc).limit(n)
	end

	def unread_messages
		received_messages.unread
	end
end

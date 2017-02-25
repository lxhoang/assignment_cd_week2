class User < ApplicationRecord
	has_secure_password

	validates :email, uniqueness: true, presence: true

	def to_s
		email
	end
end

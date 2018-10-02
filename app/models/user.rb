class User < ApplicationRecord

	before_save :encrypt_password

	validates :name, presence: true
	validates :email, presence: true
	#validates :password, presence: true
	validates :email, uniqueness: true


	def find_by_email p_email
		where(:email => p_email).first
	end

	private 

	def encrypt_password
		self.salt = SecureRandom.base64(8)
		self.password = Digest::SHA2.hexdigest(self.salt + self.password)
	end


end

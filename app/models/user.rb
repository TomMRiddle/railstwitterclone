# == Schema Information
# Schema version: 20100109004936
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#
require 'digest'
class User < ActiveRecord::Base
	attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation, :avatar_url
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	imageurl_regex = /\A(http:\/\/[a-z0-9\-\.]+\.[a-z]{2,4}(?:\/\S*)?(?:[a-z0-9_])+\.(?:jpg|jpeg|gif|png))\z/i
	
	validates :name, 	:presence	=> true,
						:length 	=> { :maximum => 50 }

	validates :email, 	:presence 	=> true,
						:format   	=> { :with => email_regex },
						:uniqueness => { :case_sensitive => false }

	# Automatically create the virtual attribute 'password_confirmation'.
    validates :password, 	:presence     => true,
							:confirmation => true,
							:length       => { :within => 6..40 }
	
	validates :avatar_url, 	:allow_blank 	=> true,
							:format   		=> { :with => imageurl_regex }
	

	before_save :encrypt_password

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		user && user.has_password?(submitted_password) ? user : nil
	end


	private
		def encrypt_password
			self.salt = make_salt if new_record?
			self.encrypted_password = encrypt(password)
		end

		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end

		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end

		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
end

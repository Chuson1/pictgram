class User < ApplicationRecord
	validates :name, presence: true, length: { maximum: 15 }
	
	VALID_EMAIL_REGEX =  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
	validates :email, 
		presence: true,
		format: { with: VALID_EMAIL_REGEX }
	
	VALID_PASSWORD_REGEX = /^(?=.*?[a-z])(?=.*?\d)[a-z\d]$/i
	validates :password, 
		length: { minimum: 8, maximum: 32},
		format: { with: VALID_PASSWORD_REGEX }
		
	validates :password_confirmation, 
		length: { minimum: 8, maximum: 32},
		format: { with: VALID_PASSWORD_REGEX }
		
	has_secure_password
end

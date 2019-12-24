class User < ApplicationRecord
	validates :name, presence: true, length: { maximum: 15}
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
							format: { with: VALID_EMAIL_REGEX }
	
	VALID_PASSWORD_REGEX = /\A(?=\d{0,99}+[a-z])(?=[a-z]{0,99}+\d)[a-z\d]{8,100}+\z/i
	validates :password, presence: true,
							length: { minimum: 8, maximum: 32 },
							format: { with: VALID_PASSWORD_REGEX }
	
	has_secure_password
	
	has_many :topics
	has_many :favorites
	has_many :favorite_topics, through: :favorites, source: 'topic'
	has_many :comments
	
end
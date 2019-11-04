class User < ApplicationRecord

	has_many :events, through: :attendances
	has_many :attendances

	validates :email, presence: true
	validates :description, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true

end

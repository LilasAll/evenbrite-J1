class Attendance < ApplicationRecord
	belongs_to :user
	belongs_to :event

	has_many :admins, foreign_key: "admin_id", class_name: "Event"
end

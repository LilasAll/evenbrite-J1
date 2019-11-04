class Attendance < ApplicationRecord
	after_create :attendance_created_send

	belongs_to :user
	belongs_to :event

  def attendance_created_send
    AttendanceMailer.attendance_created(self).deliver_now
  end

	has_many :admins, foreign_key: "admin_id", class_name: "Event"
end

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :event_attendance

  has_many :invitations, -> { where(attendance_status: :invited) },
           class_name: 'EventAttendance'

  has_many :attendees, -> { where(event_attendance: { attendance_status: :attending}) },
           through: :event_attendance, source: :user

  scope :future, -> { where('date >= ?', Date.today) }
  scope :past, -> { where('date < ?', Date.today) }
end

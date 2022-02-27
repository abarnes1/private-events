class Event < ApplicationRecord
  validate :event_date_cannot_be_in_past
  validates :date, presence: true
  validates :name, length: { in: 5..100 }, presence: true
  validates :location, length: { in: 5..100 }, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :event_attendance

  has_many :invitations, -> { where(attendance_status: :invited) },
           class_name: 'EventAttendance'

  has_many :attendees, -> { where(event_attendance: { attendance_status: :attending}) },
           through: :event_attendance, source: :user

  scope :future, -> { where('date >= ?', Date.today) }
  scope :past, -> { where('date < ?', Date.today) }

  def event_date_cannot_be_in_past
    errors.add(:date, "can't be in the past") if date < Date.today
  end

  def upcoming?
    date >= Date.today
  end
end

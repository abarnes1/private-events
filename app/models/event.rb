class Event < ApplicationRecord
  validate :event_date_cannot_be_in_past
  validates :date, :description, presence: true

  validates :name, length: { in: 5..100 }, presence: true
  validates :location, length: { in: 5..100 }, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :event_attendance

  has_many :invitations, -> { where(attendance_status: :invited) },
           class_name: 'EventAttendance'

  has_many :attendees, -> { where(event_attendance: { attendance_status: :attending }) },
           through: :event_attendance, source: :user

  scope :future, -> { where('date >= ?', Date.today) }
  scope :past, -> { where('date < ?', Date.today) }

  scope :latest_first, -> { order(date: :desc) }
  scope :earliest_first, -> { order(date: :asc) }

  # scopes named public and private not viable as they
  # conflict with ActiveRecord method names
  scope :public_visible, -> { where(private: false) }
  scope :private_visible, -> { where(private: true) }

  def event_date_cannot_be_in_past
    return true if date.nil?

    errors.add(:date, "can't be in the past") if date < Date.today
  end

  def upcoming?
    date >= Date.today
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :event_attendance

  has_many :invitations, -> { where(attendance_status: :invited) },
           class_name: 'EventAttendance'

  has_many :attended_events, -> { where(event_attendance: { attendance_status: :attending }) },
           through: :event_attendance, source: :event

  def attending?(event)
    attended_events.include?(event)
  end

  def invited?(event)
    invitations.include?(event.id)
  end
end

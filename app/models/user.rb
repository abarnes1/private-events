class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :event_attendance, foreign_key: :attendee
  has_many :attended_events, through: :event_attendance, source: :attended_event

  def attending?(event)
    attended_events.include?(event)
  end
end

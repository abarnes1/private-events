class EventAttendance < ApplicationRecord
  self.table_name = 'event_attendance'

  enum invitation_status: { invited: 0, attending: 1 }

  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end

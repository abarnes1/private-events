class EventAttendance < ApplicationRecord
  self.table_name = 'event_attendance'

  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end

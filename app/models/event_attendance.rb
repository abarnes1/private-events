class EventAttendance < ApplicationRecord
  self.table_name = 'event_attendance'

  enum attendance_status: { invited: 0, attending: 1 }

  belongs_to :user
  belongs_to :event
end

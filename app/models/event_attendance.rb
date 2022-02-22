class EventAttendance < ApplicationRecord
  self.table_name = 'event_attendance'

  enum attendance_status: { invited: 0, attending: 1 }

  belongs_to :user
  belongs_to :event

  def form_submit_text
    case attendance_status
    when :invited.to_s
      'Accept Invitation'
    when :attending.to_s
      'Quit Attending'
    else
      'Attend'
    end
  end
end

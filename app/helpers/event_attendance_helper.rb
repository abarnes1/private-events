module EventAttendanceHelper
  def form_submit_text(event_attendance)
    case event_attendance.attendance_status
    when :invited.to_s
      'Accept Invitation'
    when :attending.to_s
      'Quit Attending'
    else
      'Attend'
    end
  end
end

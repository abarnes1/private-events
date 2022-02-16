class EventAttendanceController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    @event_attendance = current_user.event_attendance.build(
      attended_event_id: params[:attended_event_id],
      invitation_status: params[:invitation_status].to_i
    )

    @event_attendance.save

    redirect_to event_path(@event_attendance.attended_event_id)
  end

  def destroy
    @event_attendance = if params[:attended_event_id]
                          EventAttendance.where(
                            attended_event_id: params[:attended_event_id],
                            attendee_id: params[:attendee_id]
                          ).first
                        else
                          EventAttendance.find(params[:id])
                        end

    event_id = @event_attendance.attended_event_id
    @event_attendance.destroy

    redirect_to event_path(event_id)
  end

  private

  def event_attendance_params
    require(:event_attendance).permit(:attended_event_id, :attendee_id, :invitation_status)
  end
end

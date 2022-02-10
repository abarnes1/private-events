class EventAttendanceController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    @event_attendance = current_user.event_attendance.build(attended_event_id: params[:attended_event_id])
    @event_attendance.save

    redirect_to event_path(@event_attendance.attended_event_id)
  end

  def destroy
    # need to figure this out by primary key
    @event_attendance = current_user.event_attendance.where(attended_event_id: params[:attended_event_id]).first
    EventAttendance.destroy(@event_attendance.id)

    redirect_to event_path(params[:attended_event_id])
  end

  private

  def event_attendance_params
    require(:event_attendance).permit(:attended_event_id, :attendee_id)
  end
end

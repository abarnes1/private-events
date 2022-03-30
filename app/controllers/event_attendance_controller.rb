class EventAttendanceController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    user = attending_user(params[:event_attendance][:email])

    if user.nil? || user == current_user
      flash[:alert] = 'Invalid user'
      redirect_to event_path(params[:event_attendance][:event_id])
      return
    end

    if EventAttendance.exists?(event_id: params[:event_attendance][:event_id], user_id: user.id)
      flash[:alert] = 'User is already invited or attending'
      redirect_to event_path(params[:event_attendance][:event_id])
      return
    end

    @event_attendance = user.event_attendance.build(event_attendance_params)
    @event_attendance.save

    redirect_to event_path(@event_attendance.event_id)
  end

  def update
    @event_attendance = EventAttendance.find(params[:id])
    @event_attendance.update(event_attendance_params)

    event_id = @event_attendance.event_id
    redirect_to event_path(event_id)
  end

  def destroy
    @event_attendance = EventAttendance.find(params[:id])
    event_id = @event_attendance.event_id

    @event_attendance.destroy
    redirect_to event_path(event_id)
  end

  private

  def event_attendance_params
    params.require(:event_attendance).permit(:event_id, :user_id, :attendance_status)
  end

  def attending_user(email)
    if email
      User.find_by_email(email)
    else
      current_user
    end
  end
end

class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])

    if user_signed_in?
      @event_attendance = EventAttendance.find_or_initialize_by(user_id: current_user.id, event_id: @event.id)
    end

    @attendees = @event.attendees
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])

    if @event.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date, :private)
  end

  def attending_user(email)
    if email
      User.find_by_email(email)
    else
      current_user
    end
  end
end

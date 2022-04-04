module EventsHelper
  def event_button_text(event)
    if event.persisted?
      'Save'
    else
      'Create'
    end
  end
end

module EventsHelper
  def form_submit_text(event)
    if event.persisted?
      'Save'
    else
      'Create'
    end
  end
end

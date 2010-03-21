module EventsHelper
  def admin_event_controls
    if signed_in?
      if current_user.admin?
        render :partial => 'admin_event_control'
      end
    end
  end

  def speaker_or_admin_event_controls(event)
    if signed_in?
      if current_user == event.speaker || current_user.admin?
        render :partial => 'speaker_or_admin_event_controls', :locals => { :event => event }
      end
    end
  end
end

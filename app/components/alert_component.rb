# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(message:, type:)
    @message = message
    @type = type
    @alert_class = alert_class(type)
    @alert_button_class = alert_button_class(type)
  end

  def render?
    flash[:notice]
  end

  private

  def alert_class(type)
    if type == 'success'
      'alert-success'
    elsif type == 'danger'
      'alert-danger'
    end
  end

  def alert_button_class(type)
    if type == 'success'
      'btn-alert-success'
    elsif type == 'danger'
      'btn-alert-danger'
    end
  end
end

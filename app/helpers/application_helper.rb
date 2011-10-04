module ApplicationHelper
  def alert_message(flash)
    if flash[:notice].present?
      content_tag(:div, flash[:notice], :id => "flash", :class => "notice")
    elsif flash[:error].present?
      content_tag(:div, flash[:error], :id => "flash", :class => "error")
    end
  end
end


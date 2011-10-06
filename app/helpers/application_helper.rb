module ApplicationHelper
  def alert_message(flash)
    if flash[:notice].present?
      content_tag(:div, flash[:notice], :id => "flash", :class => "notice")
    elsif flash[:error].present? || flash[:alert].present?
      msg = flash[:alert].blank? ? flash[:error] : flash[:alert]
      content_tag(:div, msg, :id => "flash", :class => "error")
    end
  end
  
  def automatic_flash(flash) 
    flash.each do |key, msg| 
      return content_tag :p, msg, :id => key 
    end 
  end
end




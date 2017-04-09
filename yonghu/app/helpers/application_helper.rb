module ApplicationHelper
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      next if type == :timeout
      type = :success if type == 'notice'
      type = :danger   if type == 'alert'
      text = content_tag(:div,
       content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
       message, :class => "alert fade in alert-#{type}")
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end

  def is_active?(expected_value, actual_value)
    expected_value.include?(actual_value) ? 'active' : ''
  end

  def qiniu_url(url)
    "http://olavg5ba4.bkt.clouddn.com/#{url}"
  end
end

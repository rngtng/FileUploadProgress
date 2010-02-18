# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  FLASH_NOTICE_KEYS = [:error, :notice, :warning, :message]

  def flash_messages
    return unless messages = flash.keys.select{|k| FLASH_NOTICE_KEYS.include?(k)}
    formatted_messages = messages.map do |type|      
      content_tag :div, :class => "flash #{type.to_s}" do
        flash[type]
      end
    end
    formatted_messages.join
  end

end

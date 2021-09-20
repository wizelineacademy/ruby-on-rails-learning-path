module ApplicationHelper

    def error_messages_for(object)
        render(:partial => 'application/error_messages', :locals => {:object => object})
    end

    def type_tag(color, options={})
        options[:text]  ||= ''
    
        content_tag(:span, options[:text], :class => "status #{color}")
    end
end

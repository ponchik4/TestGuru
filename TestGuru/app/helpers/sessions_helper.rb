module SessionsHelper
  def flash_message
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
    #puts 'ЙО'
  end
end

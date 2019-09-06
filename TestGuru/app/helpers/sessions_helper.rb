module SessionsHelper
  def flash_message
    if flash[:alert, :notice]
      content_tag :p, flash[:alert, :notice], class: 'flash alert'
    end
    #puts 'ЙО'
  end
end

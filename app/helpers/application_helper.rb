module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display:none"
    end
    content_tag("div", attributes, &block)
  end

  def admin?
    return session[:user_id] && session[:user_type] == 0
  end

  def user?
    return session[:user_id] && session[:user_type] == 1
  end
end

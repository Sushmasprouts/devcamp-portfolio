module ApplicationHelper
  def source_helper(layout_name)
    if session[:source] 
        gretting= "Thanks for visiting me from  #{ session[:source]} and you are on the #{layout_name} layout "
        content_tag(:p,gretting,class:"source-gretting")
    end 
  end
end

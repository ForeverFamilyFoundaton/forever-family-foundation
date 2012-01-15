module BusinessesHelper
  def step_link(step, completed, current_step)
    case completed
    when true
      if step.to_i == current_step.to_i
        content_tag :span, "Step #{step}"
      else
        link(step)
      end
      
    when false
      if step.to_i == current_step.to_i
        content_tag :span, "Step #{step}"
      else
        if step.to_i >= current_step.to_i
          "Step #{step}"
        else
          link(step)
        end
      end
    end
  end  
  
  def link(step)
    link_to "Step #{step}", edit_user_business_path(current_user, @business, step: step)
  end
end

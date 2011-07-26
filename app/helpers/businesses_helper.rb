module BusinessesHelper
  def step_link(step, state, cu_step)
    case state
    when true
      if step.to_i == cu_step.to_i
          "<span> Step #{step} </span>".html_safe
      else
        link_to "Step #{step}", edit_user_business_path(current_user, @business, :step => step), :class =>  'step'
      end
    when false
        if step.to_i == cu_step.to_i
          "<span> Step #{step} </span>".html_safe
        else
          if step.to_i >= cu_step.to_i
            "Step #{step}"
          else
             link_to "Step #{step}", edit_user_business_path(current_user, @business, :step => step), :class => 'step'
          end
        end
    end
    
    
  end
end

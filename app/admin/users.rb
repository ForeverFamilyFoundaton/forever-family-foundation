ActiveAdmin.register User do
  filter :email
  index do
    column :email, :sortable => :email do |user|
      link_to user.email, admin_user_path(user)
    end
    column :address, :sortable => false
    column :is_business, :sortable => :is_business do |user|
      user.is_business? ? 'true' : false
    end
  end

  show do
    h3 user.email
    div do
      simple_format [user.first_name, user.middle_name, user.last_name].join(' ')
    end
    div do
      simple_format ["Created at", user.created_at.to_s(:long)].join(': ')
    end
    div do
      simple_format ["Updated at", user.created_at.to_s(:long)].join(': ')
    end
    div do
      simple_format ["Cell Phone", user.cell_phone].join(': ')
    end
    div do
      simple_format ["Home Phone", user.home_phone].join(': ')
    end
    div do
      simple_format ["Work Phone", user.work_phone].join(': ')
    end
    div do
      simple_format ["State", user.state].join(': ')
    end
    div do
      simple_format ["Bussiness?", user.is_business?].join(': ')
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :first_name
      f.input :middle_name
      f.input :last_name            
      f.input :email
      f.input :state      
    end
    f.buttons
  end  
end

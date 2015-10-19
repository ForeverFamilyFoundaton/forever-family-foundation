ActiveAdmin.register AdminUser do
  menu false

  filter :email
  index do
    column :email, :sortable => :email do |user|
      link_to user.email, admin_admin_user_path(user)
    end
  end


  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :password
    end
    f.actions
  end
end

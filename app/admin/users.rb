ActiveAdmin.register User do
  menu false

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

  show do |user|
    attributes_table do
      row :name do
        [user.first_name, user.middle_name, user.last_name].join(' ')
      end
      row :id
      row :membership_number
      row :email
      row :cell_phone
      row :home_phone
      row :work_phone
      row :fax
      row :is_business
      row :address do
        user.address
      end
      row :enrolled_from
      row :do_not_mail
      row :last_sign_in_at
      row :created_at
      row :updated_at
      row :problems
    end
   table_for user.profile_preferences do
      column "Preferences" do |question|
        question.name
      end
    end
    table_for user.family_members do
      column :family_member, :name_and_relationship
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :membership_number
      f.input :email
      f.input :cell_phone
      f.input :home_phone
      f.input :work_phone
      f.input :fax
      f.input :is_business
      f.input :enrolled_from
      f.input :do_not_mail
      f.input :last_sign_in_at
      f.input :created_at
      f.input :updated_at
      f.input :problems
    end
    f.buttons
  end
end

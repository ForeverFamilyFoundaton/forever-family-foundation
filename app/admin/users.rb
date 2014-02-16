ActiveAdmin.register User do
  menu false

  filter :id
  filter :membership_number
  filter :email
  filter :first_name
  filter :middle_name
  filter :last_name
  filter :is_business
  filter :enrolled_from
  filter :do_not_mail
  filter :problems
  filter :address_state_contains
  filter :address_country_contains

  index do
    column :id
    column 'M#', :membership_number
    column :name, sortable: :last_name do |user|
      "#{user.last_name}, #{user.first_name} #{user.middle_name}"
    end
    column :email, sortable: :email do |user|
      link_to user.email, admin_user_path(user)
    end
    column :address, sortable: false
    column :is_business
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
      row :enrolled_at
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
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :membership_number
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
      f.input :cell_phone
      f.input :home_phone
      f.input :work_phone
      f.input :fax
      f.input :is_business
      f.input :enrolled_from
      f.input :enrolled_at, start_year: 2004
      f.input :do_not_mail
      f.input :last_sign_in_at
      f.input :created_at, start_year: 2004
      f.input :updated_at, start_year: 2004
      f.input :problems
      f.inputs "Address", for: [:address, f.object.address || Address.new] do |address|
        address.input :address
        address.input :city
        address.input :state
        address.input :zip
        address.input :country
      end
      f.has_many :family_members do |family_member|
        family_member.input :first_name
        family_member.input :last_name
        family_member.input :relationship
      end

    end
    f.actions
  end

  csv do
    column :id
    column :membership_number
    column :first_name
    column :middle_name
    column :last_name
    column :email
    column :cell_phone
    column :home_phone
    column :work_phone
    column :fax
    column :is_business
    column("Address: Street") { |user| user.address.address }
    column("Address: City") { |user| user.address.city }
    column("Address: State") { |user| user.address.state }
    column("Address: Zip") { |user| user.address.zip }
    column("Address: Country") { |user| user.address.country }
    column :enrolled_from
    column :enrolled_at
    column :do_not_mail
    column :last_sign_in_at
    column :created_at
    column :updated_at
    column :problems
  end
end

ActiveAdmin.register User do
  menu false
  controller do
    def scoped_collection
      end_of_association_chain.includes(:business)
    end
  end
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
  filter :preferences, as: :check_boxes

  index do
    column 'Membership Number', :membership_number
    column :first_name
    column :last_name
    column :email, sortable: :email do |user|
      link_to user.email, admin_user_path(user)
    end
    column :address, sortable: false
    column :business_name, sortable: 'businesses.name' do |user|
      user.business && user.business.name
    end
    column 'Preferences' do |user| 
      user.try(:preferences).map(&:name).to_sentence
    end
    column :enrolled_at, sortable: :enrolled_at do |user|
      user.created_at.to_s(:admin)
    end
    column :created_at, sortable: :created_at do |user|
      user.created_at.to_s(:admin)
    end
    column :updated_at, sortable: :updated_at do |user|
      user.updated_at.to_s(:admin)
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
      row :enrolled_at
      row :do_not_mail
      row :last_sign_in_at
      row :created_at
      row :updated_at
      row :problems
    end
    panel("Business details") do
      attributes_table_for user.business do
        row :name
        row :contact_name
        row :contact_email
        row :contact_phone
        row :fax
        row :promotional_additional_notes
        row :use_business_card_for_web_banner
        row :promotional_media_text
        row :promotional_media_additional_notes
        row :do_not_mail
        row :completed_step
        row :business_card do |biz|
          if biz && biz.business_card
            link_to image_tag(biz.business_card.attachment.url(:thumb)), biz.business_card.attachment.url
          end
        end
        row :business_logo do |biz|
          if biz && biz.business_logo
            link_to image_tag(biz.business_logo.attachment.url(:thumb)), biz.business_logo.attachment.url
          end
        end
        row :web_banner do |biz|
          if biz && biz.web_banner
            link_to image_tag(biz.web_banner.attachment.url(:thumb)), biz.web_banner.attachment.url
          end
        end
        row :promotional_media_mp3 do |biz|
          if biz && biz.promotional_media_mp3
            link_to biz.promotional_media_mp3.attachment_file_name, biz.promotional_media_mp3.attachment.url
          end
        end
        row :promotional_media_upload do |biz|
          if biz && biz.promotional_media_upload
            link_to biz.promotional_media_upload.attachment_file_name, biz.promotional_media_upload.attachment.url
          end
        end
      end
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
      f.input :is_business do |user|
        user.business.present?
      end
      f.input :enrolled_from
      f.input :enrolled_at, start_year: 2004
      f.input :do_not_mail
      f.input :last_sign_in_at
      f.input :created_at, start_year: 2004
      f.input :updated_at, start_year: 2004
      f.input :problems
      f.input :profile_preferences, as: :check_boxes
      f.inputs "Address", for: [:address, f.object.address || Address.new] do |address|
        address.input :address
        address.input :city
        address.input :state
        address.input :zip
        # address.input :country
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
    column('Preferences') do |user| 
      user.try(:preferences).map(&:name).to_sentence
    end
    column("Address: Street") { |user| user.address.try(:address) }
    column("Address: City") { |user| user.address.try(:city) }
    column("Address: State") { |user| user.address.try(:state) }
    column("Address: Zip") { |user| user.address.try(:zip) }
    column("Address: Country") { |user| user.address.try(:country) }
    column :enrolled_from
    column :enrolled_at
    column :do_not_mail
    column :last_sign_in_at
    column :created_at
    column :updated_at
    column :problems
  end
end

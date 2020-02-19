ActiveAdmin.register User do
  menu false

  scope :active, :kept, default: true
  scope :soft_deleted, :discarded
  scope :all
  scope 'Registered for ADG', :registered_for_adg

  action_item :soft_delete, only: :show, if: proc{ !user.discarded? } do
    link_to 'Soft-Delete', soft_delete_admin_user_path(user), method: :delete, data: { confirm: "Are you sure you want to soft-delete this user?" }
  end

  action_item :un_soft_delete, only: :show, if: proc{ user.discarded? } do
    link_to 'Un-Soft-Delete', un_soft_delete_admin_user_path(user), method: :put, data: { confirm: "Are you sure you want to UN-soft-delete this user?" }
  end

  member_action :soft_delete, method: :delete do
    resource.discard
    redirect_to admin_users_path, notice: "User #{resource.id} has been soft-deleted."
  end

  member_action :un_soft_delete, method: :put do
    resource.undiscard
    redirect_to admin_users_path, notice: "User #{resource.id} has been reinstated."
  end

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
  filter :snail_mail
  filter :do_not_mail
  filter :problems
  filter :categories, as: :check_boxes
  filter :address_state_contains
  filter :address_country_contains
  filter :preferences, as: :check_boxes
  filter :profile_preferences, as: :check_boxes
  filter :subscription_preferences, as: :check_boxes

  index download_links: [:csv] do
    column 'Membership Number', :membership_number
    column :first_name
    column :last_name
    column :email, sortable: :email
    column :business_name, sortable: 'businesses.name' do |user|
      user.business && user.business.name
    end
    actions
  end

  show do |user|
    attributes_table do
      row :deleted_at
      row :name do
        [user.first_name, user.middle_name, user.last_name].join(' ')
      end
      row :id
      row :membership_number
      row :email
      row :cell_phone
      row :home_phone
      row :work_phone
      row :categories do
        user.categories.map(&:name).to_sentence
      end
      row :fax
      row :medium_registration
      row :link_to_mediumform do
        if user.mediumform.present?
          link_to('Mediumform is Here', admin_mediumform_path(user.mediumform.id))
        else
          status_tag("No Mediumform Available")
        end
      end
      row :sitter_registration
      row :link_to_sitterform do
        if user.sitterform.present?
          link_to('Sitterform is Here', admin_sitterform_path(user.sitterform.id))
        else
          status_tag("No Sitterform Available")
        end
      end
      row :is_business
      row :address do
        user.address
      end
      row :enrolled_from
      row :enrolled_at
      row :do_not_mail
      row :snail_mail
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
        row :snail_mail
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

    table_for user.adg_answers do
      column "Question" do |question|
        question.question
      end

      column "Answer" do |question|
        question.answer
      end
    end

    table_for user.profile_preferences do
      column "Profile Preferences" do |question|
        question.name
      end
    end

    table_for user.subscription_preferences do
      column "Subscription Preferences" do |question|
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
      f.input :medium_registration, as: :boolean
      f.input :sitter_registration, as: :boolean
      f.input :is_business do |user|
        user.business.present?
      end
      f.input :enrolled_from
      f.input :enrolled_at, start_year: 2004
      f.input :do_not_mail
      f.input :snail_mail
      f.input :last_sign_in_at
      f.input :created_at, start_year: 2004
      f.input :updated_at, start_year: 2004
      f.input :problems
      f.input :categories, as: :check_boxes
      f.input :profile_preferences, as: :check_boxes, collection: Preference.profile_preferences
      f.input :subscription_preferences, as: :check_boxes, collection: Preference.subscription_preferences
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
    column('Preferences') do |user|
      user.try(:preferences).map(&:name).to_sentence
    end
    column('Categories') do |user|
      user.try(:categories).map(&:name).to_sentence
    end
    column("Address: Street") { |user| user.address.try(:address) }
    column("Address: City") { |user| user.address.try(:city) }
    column("Address: State") { |user| user.address.try(:state) }
    column("Address: Zip") { |user| user.address.try(:zip) }
    column("Address: Country") { |user| user.address.try(:country) }
    column :enrolled_from
    column :enrolled_at
    column :do_not_mail
    column :snail_mail
    column :last_sign_in_at
    column :created_at
    column :updated_at
    column :problems
  end
end

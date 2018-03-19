ActiveAdmin.register Mediumform do 
  menu false
  config.filters = false

  index do |mediumform|
    column :id
    column :user_id
    # column 'Book Categories' do |f|
    #   f.try(:recommended_book_categories).map(&:name).to_sentence
    # end
    column :email
    column :mobile

    actions
  end

  show do |medium|
    attributes_table do
      row :id
      row :phone
      row :cell
      row :use_professional
      row :professional_name
      row :professional_address_line1
      row :professional_address_line2
      row :professional_phone_number
      row :professional_email
      row :use_personal
      row :personal_name
      row :personal_address_line
      row :personal_address_line2
      row :other_businesses
      row :health_healing
      row :website
      row :facebook
      row :pinterest
      row :instagram
      row :twitter
      row :youtube
      row :blog
      row :sitter1
      row :sitter2
      row :sitter3
      row :sitter4
      row :sitter5
      row :signature
      row :signature_checkbox
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :user_id, input_html: {disabled: true}
      f.inputs 'Professional Alternative' do
        f.input :use_professional
        f.input :professional_name
        f.input :professional_address_line1
        f.input :professional_address_line2
        f.input :professional_phone_number
        f.input :professional_email
      end
      f.inputs 'Personal Alternative' do
        f.input :use_personal
        f.input :personal_name
        f.input :personal_address_line1
        f.input :personal_address_line2
        f.input :personal_phone_number
        f.input :personal_email
      end
      f.inputs 'Social Networking' do
        f.input :website, :input_html => {:rows => 1}
        f.input :facebook, :input_html => {:rows => 1}
        f.input :pinterest, :input_html => {:rows => 1}
        f.input :instagram, :input_html => {:rows => 1}
        f.input :twitter, :input_html => {:rows => 1}
        f.input :youtube, :input_html => {:rows => 1}
        f.input :blog, :input_html => {:rows => 1}
      end
      f.inputs 'Sitters' do
        f.input :sitter1
        f.input :sitter2  
        f.input :sitter3
        f.input :sitter4
        f.input :sitter5
      end
      f.inputs 'Other' do
        f.input :other_businesses
      end

      f.inputs 'Signature' do
        f.input :signature
        f.input :signature_checkbox
      end
    end
    f.actions
  end
end


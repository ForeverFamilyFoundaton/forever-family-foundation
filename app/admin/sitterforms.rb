ActiveAdmin.register Sitterform do 
  menu false
  config.filters = false

  index do |sitterform|
    column :id
    column :user_id
    # column 'Book Categories' do |f|
    #   f.try(:recommended_book_categories).map(&:name).to_sentence
    # end
    column :email
    column :mobile

    actions
  end

  show do |sitter|
    attributes_table do
      row :id
      row :user_id
      row :phone
      row :cell
      row :alt_email
      row :website
      row :facebook
      row :pinterest
      row :instagram
      row :twitter
      row :youtube
      row :blog
      row :related_contact_info
      row :medium_contacts
      row :belief_type
      row :signature
      row :signature_checkbox
      table_for sitter.known_deads do
        column "Lost Loved Ones" do |f|
          "Name: " + f.name + "   relationship: " + f.relationship.name
        end
      end
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :user_id, input_html: {disabled: true}
      f.input :phone
      f.input :cell
      f.input :alt_email
      f.inputs 'Social Media Presence' do
        f.input :website, :input_html => {:rows => 1}
        f.input :facebook, :input_html => {:rows => 1}
        f.input :pinterest, :input_html => {:rows => 1}
        f.input :instagram, :input_html => {:rows => 1}
        f.input :twitter, :input_html => {:rows => 1}
        f.input :youtube, :input_html => {:rows => 1}
        f.input :blog, :input_html => {:rows => 1}
        f.input :related_contact_info
        f.input :medium_contacts
      end
 

      # below line creates radio button but does not save edits
      # f.input :belief_types, label: "Regarding an Afterlife, which would you consider yourself to be?",  as: :check_boxes     
      
      f.inputs "Regarding an Afterlife, which would you consider yourself to be?" do
        f.input :belief_type do |belief|
          belief.input :name
        end
      end
      # f.inputs :known_deads_name
 
      f.inputs 'Lost Loved Ones' do
        f.has_many :known_deads do |known_dead|
          known_dead.input :name
          known_dead.input :relationship
          known_dead.input :_destroy, as: :boolean, label: "delete"
        end
      end

      f.input :signature
      f.input :signature_checkbox
    end
    f.actions
  end
end


ActiveAdmin.register Sitterform do 
  menu false
  config.filters = false

  index do |sitterform|
    column :id
    column :user_id
    # column 'Book Categories' do |f|
    #   f.try(:recommended_book_categories).map(&:name).to_sentence
    # end
    column :phone
    column :mobile

    actions
  end

  show do |sitter|
    attributes_table do
      row :user_id
      row :phone
      row :cell
      row :alt_email
      table_for sitter.known_deads do
        column "Known Deceaseds" do |f|
          "Name: " + f.name + "   relationship: " + f.relationship.name
        end
      end
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :user_id
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
      end
 
      f.input :belief_type, as: :check_boxes     
      # f.inputs 'Known Deceaseds' do
      #   f.has_many :belief_type do |belief|
      #     belief.input :name
      #   end
      # end
      # f.inputs :known_deads_name
 
      f.inputs 'Lost Loved Ones' do
        f.input :lost_loved_one
        f.has_many :known_deads do |known_dead|
          known_dead.input :name
          known_dead.input :relationship
          known_dead.input :_destroy, as: :boolean, label: "delete"
        end
      end
      # f.input :uk_amazon_link
      # f.input :cad_amazon_link
      # f.input :recommended_book_categories, as: :check_boxes
      f.input :signature
    end
    f.actions
  end
end


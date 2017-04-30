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

  show do |recc_book|
    attributes_table do
      row :user_id
      row :phone
      row :cell
      row :alt_email
      # table_for recc_book.recommended_book_categories do
      #   column "Book Categories" do |f|
      #     f.name
      #   end
      # end
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :user_id
      f.input :phone
      f.input :cell
      f.input :alt_email
      f.input :website, :input_html => {:rows => 1}
      f.input :facebook, :input_html => {:rows => 1}
      f.input :pinterest, :input_html => {:rows => 1}
      f.input :instagram, :input_html => {:rows => 1}
      f.input :twitter, :input_html => {:rows => 1}
      f.input :youtube, :input_html => {:rows => 1}
      f.input :blog, :input_html => {:rows => 1}

      # f.input :uk_amazon_link
      # f.input :cad_amazon_link
      # f.input :recommended_book_categories, as: :check_boxes
    end
    f.actions
  end
end


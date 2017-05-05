ActiveAdmin.register Relationship do 
  menu false
  config.filters = false

  index do |f|
    column :id
    column :name
    column :typeof

    actions
  end

  show do |f|
    attributes_table do
      row :id
      row :name
      row :typeof
      # table_for recc_book.recommended_book_categories do
      #   column "Book Categories" do |f|
      #     f.name
      #   end
      # end
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :typeof

      # f.input :uk_amazon_link
      # f.input :cad_amazon_link
      # f.input :recommended_book_categories, as: :check_boxes
    end
    f.actions
  end
end


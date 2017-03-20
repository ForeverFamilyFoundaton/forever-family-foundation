ActiveAdmin.register RecommendedBook do 
  menu false
  config.filters = false

  index do |recc_book|
    column :id do |q|
      q.id.to_s
    end
    column :title
    column 'Book Categories' do |f|
      f.try(:recommended_book_categories).map(&:name).to_sentence
    end
    column :author
    column :amazon_link

    actions
  end

  show do |recc_book|
    attributes_table do
      row :title
      row :author
      row :amazon_link
      row :uk_amazon_link
      row :cad_amazon_link
      table_for recc_book.recommended_book_categories do
        column "Book Categories" do |f|
          f.name
        end
      end
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :author
      f.input :amazon_link
      f.input :uk_amazon_link
      f.input :cad_amazon_link
      f.input :recommended_book_categories, as: :check_boxes
    end
    f.actions
  end
end


ActiveAdmin.register ReccBook do |variable|
  menu false
  config.filters = false

  index do |recc_book|
    column :title
    column 'Book Categories' do |f|
      f.try(:recc_book_categories).map(&:name).to_sentence
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
      table_for recc_book.recc_book_categories do
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
      f.input :recc_book_categories, as: :check_boxes
    end
    f.actions
  end
end


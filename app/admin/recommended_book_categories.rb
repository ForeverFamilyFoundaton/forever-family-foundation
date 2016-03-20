ActiveAdmin.register RecommendedBookCategory do 
  menu false
  config.filters = false

  index do
    column :id
    column :name

    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
    end
    f.actions
  end
end
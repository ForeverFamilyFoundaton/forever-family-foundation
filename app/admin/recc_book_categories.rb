ActiveAdmin.register ReccBookCategory do |variable|
  menu false
  config.filters = false

  index do
    column :id
    column :name
    #column :reccbookcat_id

    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      #f.input :reccbookcat_id
    end
    f.actions
  end
end
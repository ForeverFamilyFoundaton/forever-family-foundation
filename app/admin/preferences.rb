ActiveAdmin.register Preference do
  menu false
  config.filters = false


  index do
    column :name
    column :preference_type
    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :preference_type, as: :select, collection: ['ADG', 'Profile', 'Subscription', 'Medium']
    end
    f.actions
  end


end

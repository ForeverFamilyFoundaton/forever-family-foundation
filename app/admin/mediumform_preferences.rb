ActiveAdmin.register MediumformPreference do
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
      f.input :preference_type, as: :select, collection: ['SelfClassify', 'Practice']
    end
    f.actions
  end


end

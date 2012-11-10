ActiveAdmin.register ConfigVariable do
    index do
    column :name
    column :value
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :value
    end
    f.buttons
  end

end

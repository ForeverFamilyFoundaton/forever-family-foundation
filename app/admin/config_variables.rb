ActiveAdmin.register ConfigVariable do
    menu false

    index do
    column :name
    column :value
    column "Actions" do |q|
      link_to 'Show', admin_config_variable_path(q)
    end

  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :value
    end
    f.actions
  end

end

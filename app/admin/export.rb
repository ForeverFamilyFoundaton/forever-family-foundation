ActiveAdmin.register Export do
  index do
    id_column
    column :created_at 
    actions do |export|
      link_to "Download", export_path(export) if export.has_file? 
    end
  end

  form do |f|
    f.actions
  end
end

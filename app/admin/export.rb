ActiveAdmin.register Export do
  actions :all, except: [:edit]
  
  member_action :download, method: :get do
    file = open(resource.file.url) 
    send_data file.read, filename: resource.file_file_name, type: "application/csv"
  end

  index do
    id_column
    column :created_at 
    actions do |export|
      link_to "Download", download_admin_export_path(export) if export.has_file? 
    end
  end

  form do |f|
    f.actions
  end
end

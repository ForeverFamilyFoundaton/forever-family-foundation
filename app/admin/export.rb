ActiveAdmin.register Export do
  actions :all, except: [:edit]
  
  member_action :download, method: :get do
    send_file resource.file.path
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

ActiveAdmin.register Announcement do
  menu false
  index do
    column :body do |announcement|
      link_to announcement.body, admin_announcement_path(announcement)
    end
    column :link, sortable: false
    column 'Button text', :button, sortable: false 
    column :start_date
    column :end_date
  end

  show do
    attributes_table do
      row :body
      row :link
      row :button
      row :start_date 
      row :end_date 
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :body, :as => :string
      f.input :link, :as => :string
      f.input :button, :as => :string
      f.input :start_date
      f.input :end_date
    end
    f.actions
  end

  csv do
    column :body
    column :link
    column :button
    column :start_date 
    column :end_date 
  end
end

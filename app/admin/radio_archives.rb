ActiveAdmin.register RadioArchive do
  index do
    column :title
    column :guest
    column :date
    column :format
    column :format do |q|
      link_to 'Download', q.attached_file.attachment.url
    end
    column 'Actions' do |q|
      link_to 'Delete', admin_radio_archive_path(q, method: :delete)
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :guest
      f.input :date
      f.input :format, as: :select, collection: ['Signs of Life', 'Mediums & Messages', 'The Gathering']
    end

    f.inputs "Recording", :for => [:attached_file, f.object.attached_file || AttachedFile.new] do |recording_form|
      recording_form.input :attachment, as: :file
    end

    f.has_many :external_links do |link_form|
      link_form.input :text
      link_form.input :url      
    end
    
    f.buttons
  end
end

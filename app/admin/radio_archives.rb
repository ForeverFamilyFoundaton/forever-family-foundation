ActiveAdmin.register RadioArchive do
  index do
    column :title do |q|
      link_to q.title, admin_radio_archive_path(q, method: :delete)
    end 
    column :guest
    column :date
    column :format
    column :attached_file do |q|
      link_to 'Download', q.attached_file.attachment.url if q.attached_file 
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
  
  
  show do
    h2 radio_archive.title
    p radio_archive.guest
    p radio_archive.date.to_s
  end
      
end

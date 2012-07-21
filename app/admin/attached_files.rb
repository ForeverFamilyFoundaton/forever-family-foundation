ActiveAdmin.register AttachedFile do
  index do
    column 'Image' do |q|
      image_tag q.attachment.url
    end
    column "Actions" do |q|
      link_to "Delete", admin_attached_file_path(q, method: :delete)
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs 'Details' do
      f.input :attachment, as: :file
    end
    f.buttons
  end
  
  show do |file|
    image_tag file.attachment.url
  end
end

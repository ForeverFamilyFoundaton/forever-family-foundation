ActiveAdmin.register AttachedFile do
  menu false
  index do
    column 'ID' do |q|
      q.id.to_s
    end
    column 'Thumbnail (if image)' do |q|
      image_tag q.attachment.url(:thumb) if q.image?
    end
    column 'File name/path' do |q|
      link_to q.attachment_file_name, q.attachment.url
    end
    column 'Type' do |q|
      q.attachment_content_type
    end
    column :updated_at
    
    column "Actions" do |q|
      link_to "Delete", admin_attached_file_path(q, method: :delete)
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs 'Details' do
      f.input :attachment, as: :file
    end
    f.actions
  end

  show do |file|
    image_tag file.attachment.url
  end
end

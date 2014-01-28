ActiveAdmin.register CmsImage do
  menu false
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "CMS Image", :multipart => true do
      f.input :title
      f.input :image
      f.input :caption
    end
    f.actions
  end

  index do
    column 'Thumbnail' do |q|
      image_tag q.image.url(:thumb)
    end
    column 'URL' do |q|
      link_to q.image.url, q.image.url
    end
    column :title
    column :caption
    column "Actions" do |q|
      link_to 'Show', admin_cms_image_path(q)
    end
  end

  show do
    h2 cms_image.title
    div do
      image_tag cms_image.image.url
    end
    p cms_image.image.url
    p cms_image.caption
  end
end

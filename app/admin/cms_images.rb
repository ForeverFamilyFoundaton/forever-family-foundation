ActiveAdmin.register CmsImage do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "CMS Image", :multipart => true do
      f.input :title
      f.input :image      
      f.input :caption
    end    
    f.buttons
  end
  
  show do
    h2 cms_image.title 
    div do   
      image_tag cms_image.image.url
    end
    p cms_image.caption
  end
end

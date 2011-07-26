ActiveAdmin.register CmsPage do
  filter :title
  filter :reference_string
  index :as => :blog

  form do |f|
    f.inputs "Details" do
      f.input :reference_string      
      f.input :title
      f.input :sub_title
      f.input :body
    end
    f.buttons
  end
  
  show do
    h1 cms_page.reference_string
    h2 cms_page.title    
    h3 cms_page.sub_title
    div do
      raw Redcarpet.new(cms_page.body).to_html
    end
  end
end

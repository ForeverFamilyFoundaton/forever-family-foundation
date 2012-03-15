ActiveAdmin.register CmsPage do
  filter :title
  filter :reference_string
  index :as => :blog

  form do |f|
    f.inputs 'Details' do
      f.input :reference_string      
      f.input :title
      f.input :sub_title      
      f.input :body
    end
    f.buttons
  end
  
  show do
    h1 cms_page.title        
    h2 cms_page.sub_title    
    div do
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
      raw markdown.render(cms_page.body)
    end
  end
end

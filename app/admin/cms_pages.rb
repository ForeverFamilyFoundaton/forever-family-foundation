ActiveAdmin.register CmsPage do
  
  index do
    column :reference_string
    column 'Title' do |q|
      link_to q.title, page_url(q)
    end
    column 'URL' do |q|
      page_url(q)
    end
    column "Actions" do |q|
      link_to 'Show', admin_cms_image_path(q)
    end
  end

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

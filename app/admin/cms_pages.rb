ActiveAdmin.register CmsPage do
  menu false
  index do
    column :reference_string
    column 'Title' do |q|
      q.title
    end
    column 'URL' do |q|
      link_to page_by_id_url(q), page_by_id_url(q)
    end
    column :updated_at
    column "Actions" do |q|
      link_to 'Show', admin_cms_page_path(q)
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :reference_string
      f.input :title
      f.input :sub_title
      f.input :body
    end
    f.actions
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

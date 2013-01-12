class EmailTemplate < CmsPage

  default_scope where reference_string: 'EmailTemplate'

  alias_attribute :subject, :title

end

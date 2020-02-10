class CmsPage < ActiveRecord::Base
  include RankedModel
  ranks :position, with_same: :parent_id

  acts_as_tree order: :position

  alias_attribute :subject, :title

  validates :reference_string, presence: true, uniqueness: true
  #validates :title, presence: true

  attr_accessible :reference_string, :title, :sub_title, :nav_text, :body, :meta_keywords, :meta_description

  def self.get(reference_string)
    where('lower(reference_string) = ?', reference_string.downcase).first || self.new(title: reference_string)
  end

  def is_site_index?
    reference_string == 'Site: Index'
  end
end

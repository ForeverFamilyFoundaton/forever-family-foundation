class CmsPage < ActiveRecord::Base
  acts_as_tree :order => :position
  acts_as_list :scope => :parent_id

  validates :reference_string, presence: true, uniqueness: true
  validates :title, :presence => true

  attr_accessible :reference_string, :title, :sub_title, :nav_text, :body, :meta_keywords, :meta_description

  def self.get(reference_string)
    find_by_reference_string(reference_string) || self.new(:title => reference_string, :sub_title => "CMS Page Missing  - #{reference_string}")
  end
  
  def is_site_index?
    reference_string == 'Site: Index'
  end
end

class Announcement < ActiveRecord::Base
  validates_presence_of :button, :link
  validates_uniqueness_of :start_date, :end_date
  validate :overlapping_dates

  def date_range
    start_date..end_date
  end

  def self.current
    order('start_date DESC').first || new 
  end
  
  def exists?
    !new_record?
  end
end
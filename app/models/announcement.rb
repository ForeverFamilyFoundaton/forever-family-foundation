class Announcement < ActiveRecord::Base
  validates_presence_of :button, :link, :body, :start_date, :end_date
  validates_uniqueness_of :start_date, :end_date
  validate :overlapping_start_dates, :overlapping_end_dates

  def date_range
    start_date..end_date
  end

  def overlapping_start_dates
    # binding.pry
    errors.add(:start_date, "cannot overlap with another announcement") unless self.class.where(start_date: start_date..end_date).empty?
  end
  
  def overlapping_end_dates 
    errors.add(:end_date, "cannot overlap with another announcement") unless self.class.where(end_date: start_date..end_date).empty?
  end 
  
  def self.current
    where("end_date >= ?", Date.today).first
  end
  
  def exists?
    !new_record?
  end
end
class Announcement < ActiveRecord::Base
  attr_accessible :start_date, :end_date, :button, :link, :body

  validates_presence_of :button, :link, :body, :start_date, :end_date
  validates_uniqueness_of :start_date, :end_date
  before_save :end_before_start, :overlapping_dates

  def date_range
    start_date..end_date
  end

  def overlapping_start_dates
    # self.class.where("start_date <= :start_date", :start_date)
    errors.add(:start_date, "cannot overlap with another announcement") unless self.class.where(start_date: start_date..end_date).empty?
  end
  
  def overlapping_end_dates 
    errors.add(:end_date, "cannot overlap with another announcement") unless self.class.where(end_date: start_date..end_date).empty?
  end 

  def overlapping_dates
    announcements = Announcement.all
    if announcements.any? { |announcement| announcement.date_range.overlaps? date_range } and new_record?
      errors.add(:base, "Announcement conflicts with other announcements") 
      false
    end
  end

  def end_before_start
    if start_date > end_date
      errors.add(:end_date, "cannot be earlier than start date")
      false
    end
  end
  
  def self.current
    where("end_date >= ?", Date.today).first
  end
  
  def exists?
    !new_record?
  end
end
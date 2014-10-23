class Announcement < ActiveRecord::Base
  validates_presence_of :button, :link, :body, :start_date, :end_date
  validates_uniqueness_of :start_date, :end_date
  validate :end_before_start, :overlapping_dates

  def date_range
    start_date..end_date
  end

  def overlapping_start_dates
    self.class.where("start_date <= :start_date", :start_date)
    errors.add(:start_date, "cannot overlap with another announcement") unless self.class.where(start_date: start_date..end_date).empty?
  end
  
  def overlapping_end_dates 
    errors.add(:end_date, "cannot overlap with another announcement") unless self.class.where(end_date: start_date..end_date).empty?
  end 

  def overlapping_dates
    announcements = Announcement.all
    errors.add(:base, "Announcement conflicts with other announcements") if announcements.any? { |announcement| announcement.date_range.overlaps? date_range }
  end

  def end_before_start
    errors.add(:end_date, "cannot be earlier than start date") if start_date > end_date
  end
  
  def self.current
    where("end_date >= ?", Date.today).first
  end
  
  def exists?
    !new_record?
  end
end
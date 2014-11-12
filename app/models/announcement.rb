class Announcement < ActiveRecord::Base
  attr_accessible :start_date, :end_date, :button, :link, :body
  
  validates :button, presence: true
  validates :link, presence: true
  validates :body, presence: true
  validates :start_date, presence: true, uniqueness: true
  validates :end_date, presence: true, uniqueness: true
  validate :overlapping_dates, on: :create
  validate :start_date_before_end_date

  def date_range
    start_date..end_date
  end

  def overlapping_dates
    announcements = Announcement.all
    errors.add(:base, "Announcement conflicts with other announcements") if announcements.any? { |announcement| announcement.date_range.overlaps? date_range }
  end

  def start_date_before_end_date
    errors.add(:end_date, "cannot be earlier than start date") if start_date > end_date
  end
  
  def self.current
    where("end_date >= ?", Date.today).first
  end
  
  def exists?
    !new_record?
  end
end
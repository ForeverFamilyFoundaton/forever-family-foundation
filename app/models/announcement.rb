class Announcement < ActiveRecord::Base
  attr_accessible :start_date, :end_date, :button, :link, :body

  validates :button, presence: true
  validates :link, presence: true
  validates :body, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :overlapping_dates
  validate :start_date_before_end_date

  def overlapping_dates
    if Announcement.exists?(start_date: start_date..end_date) || Announcement.exists?(end_date: start_date..end_date)
      errors.add(:base, "Conflicts with other Announcements (overlapping dates)")
    end
  end

  def start_date_before_end_date
    errors.add(:end_date, "cannot be earlier than start date") if start_date > end_date
  end

  def self.current
    where("end_date >= :end_date AND start_date <= :start_date", {end_date: Date.today, start_date: Date.today}).order(:start_date).first
  end
end

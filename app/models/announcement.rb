class Announcement < ActiveRecord::Base
  attr_accessible :id, :start_date, :end_date, :button, :link, :body

  validates :button, presence: true
  validates :link, presence: true
  validates :body, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :overlapping_dates
  validate :start_date_before_end_date

  def overlapping_dates
  		find_dates = Announcement.where(start_date: start_date..end_date).ids
  		find_dates +=  Announcement.where(end_date: start_date..end_date).ids
  		if (find_dates.count(id) < find_dates.count)
  			errors.add(:base, "Conflicts with other Announcements (overlapping dates)")
  		end
  end


  def start_date_before_end_date
    if start_date && end_date && start_date > end_date
      errors.add(:end_date, "cannot be earlier than start date") 
    end
  end

  def self.current
    where("end_date >= :end_date AND start_date <= :start_date", {end_date: Date.today, start_date: Date.today}).order(:start_date).first
  end
end

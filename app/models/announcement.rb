class Announcement < ActiveRecord::Base
  attr_accessible :start_date, :end_date, :button, :link, :body

  validates :button, presence: true
  validates :link, presence: true
  validates :body, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :overlapping_dates
  validate :start_date_before_end_date
  
  def self.current
    find_by("end_date >= :start_date AND start_date <= :end_date",{end_date: Date.today, start_date: Date.today})
  end

  def overlapping_dates
    if start_date && end_date
      if d = Announcement.where(['(end_date >= :start_date AND start_date <= :end_date ) AND id is distinct from :id',
                                 start_date: start_date, end_date: end_date, id: id]).first
        errors.add(:base, "New Announcement Conflicts with other Announcements " + d.start_date.to_s + ", " + d.end_date.to_s)
      end
    end
  end

  def start_date_before_end_date
    if start_date && end_date && start_date > end_date
      errors.add(:end_date, "cannot be earlier than start date") 
    end
  end

end
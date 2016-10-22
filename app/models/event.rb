class Event < ActiveRecord::Base

  validates_presence_of :start_time
  validates_presence_of :end_time
  validates_presence_of :title

  attr_accessible :start_time, :end_time, :title, :description, :url, :pic_link

  scope :upcoming, -> { where("end_time >= ?", Time.zone.now).order('start_time asc').limit(6) }
  scope :all_upcoming, -> { where("end_time >= ?", Time.zone.now).order('start_time asc') }

  attr_accessible :title, :url, :pic_link, :description, :start_time, :end_time

  def times
    if start_time.day == end_time.day
      "#{start_time.to_s(:ordinal_date)} " + [start_time.strftime("%l:%M %p"), end_time.strftime("%l:%M %p")].join(' - ')
    else
      [start_time.to_s(:events), end_time.to_s(:events)].join(' to ')
    end
  end
end

class Event < ActiveRecord::Base

  validate :start_time, presence: true
  validate :end_time, presence: true
  validate :title, presence: true

  attr_accessible :start_time, :end_time, :title, :description, :url

  scope :upcoming, -> { where("start_time >= ?", Time.now).order('start_time asc').limit(4) }
  scope :all_upcoming, -> { where("start_time >= ?", Time.now).order('start_time asc') }

  def times
    if start_time.day == end_time.day
      "#{start_time.to_s(:ordinal_date)} " + [start_time.strftime("%I:%M %p"), end_time.strftime("%I:%M %p")].join(' - ')
    else
      [start_time.to_s(:events), end_time.to_s(:events)].join(' to ')
    end
  end
end

class Event < ActiveRecord::Base

  validate :start_time, presence: true
  validate :end_time, presence: true
  validate :title, presence: true

  scope :upcoming, -> { where("start_time >= ?", Time.now).order('start_time asc').limit(4) }
  scope :all_upcoming, -> { where("start_time >= ?", Time.now).order('start_time asc') }

  attr_accessible :title, :url, :description, :start_time, :end_time

  def times
    if start_time && end_time
      [start_time.to_s(:events), end_time.to_s(:events)].join(' to ')
    end
  end
end

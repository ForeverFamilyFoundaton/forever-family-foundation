class Event < ActiveRecord::Base

  validate :start_time, presence: true
  validate :end_time, presence: true
  validate :title, presence: true

  scope :upcoming, :conditions => ["start_time >= ?", Time.now], order: 'start_time asc', limit: 4

  def times
    if start_time.strftime('%j') == end_time.strftime('%j')
      [start_time.to_s(:events), end_time.strftime('%l:%M %p')].join(' to ')
    else
      [start_time.to_s(:events), end_time.to_s(:events)].join(' to ')
    end
  end
end

class Event < ActiveRecord::Base
  scope :upcoming, :conditions => ["start_time >= ?", Time.now]
end

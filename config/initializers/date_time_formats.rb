# date.to_s(:events)
Date::DATE_FORMATS[:events] = '%m/%d/%Y'
Time::DATE_FORMATS[:admin] = '%m/%d/%y %H:%M'
Time::DATE_FORMATS.merge! :events => lambda { |time|
  time.strftime("%b #{ActiveSupport::Inflector.ordinalize(time.day)}, %Y %l:%M %p")
}
Time::DATE_FORMATS[:ordinal_date] = -> (time) { time.strftime("%b #{ActiveSupport::Inflector.ordinalize(time.day)}, %Y")}
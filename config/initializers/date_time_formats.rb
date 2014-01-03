Date::DATE_FORMATS[:events] = '%m/%d/%Y'
Time::DATE_FORMATS.merge! :events => lambda { |time|
  time.strftime("%b #{ActiveSupport::Inflector.ordinalize(time.day)},  %l:%M %p %Y")
}

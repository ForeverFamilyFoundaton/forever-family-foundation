class AdgQuestion < ActiveRecord::Base
  validates_presence_of :question

  attr_accessible :question, :show_radio
end

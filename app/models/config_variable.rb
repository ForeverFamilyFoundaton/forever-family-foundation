class ConfigVariable < ActiveRecord::Base
  attr_accessible :name, :value
  attr_readonly :name
end

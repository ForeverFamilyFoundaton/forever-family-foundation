class MediumformPreferenceSelection < ActiveRecord::Base
  belongs_to :mediumform
  belongs_to :mediumform_preference

  attr_accessible :mediumform_ids, :mediumform_preference_ids
end

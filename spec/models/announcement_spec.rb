require 'spec_helper'

describe Announcement do
  before { FactoryGirl.create(:announcement) }

  it { should validate_uniqueness_of :start_date }
  it { should validate_uniqueness_of :end_date }
  it { should validate_presence_of :button }
  it { should validate_presence_of :link }

  context 'when two announcements overlap' do
    it "should not save" do
      announcement = FactoryGirl.build(:announcement)
      expect(announcement.save).to eq(false) 
    end
  end

  after { Announcement.destroy_all }

end
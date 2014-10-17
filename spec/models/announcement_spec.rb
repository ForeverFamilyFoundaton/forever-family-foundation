require 'spec_helper'

describe Announcement do
  subject { FactoryGirl.build(:announcement) } 
  it { should validate_uniqueness_of :start_date }
  it { should validate_uniqueness_of :end_date }
  it { should validate_presence_of :button }
  it { should validate_presence_of :body }
  it { should validate_presence_of :link }

  context 'when two announcements overlap' do
    it "should not save" do
      FactoryGirl.create(:announcement)
      announcement = FactoryGirl.build(:announcement)
      expect(announcement.save).to eq(false) 
    end
  end

  context 'end date earlier than start date' do
    it "will not save" do
      subject { FactoryGirl.build(:announcement) }
      subject.end_date = subject.start_date - 1.day
      expect(subject.save).to eq(false)
      # subject {  } 
    end
  end

  after { Announcement.destroy_all }

end
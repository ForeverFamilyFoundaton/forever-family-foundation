# spec/models/announcement_spec.rb

require 'spec_helper'

describe Announcement do
  #FactoryGirl.create(:announcement)
  #subject { FactoryGirl.build(:announcement) }
  let (:subject) { FactoryGirl.build(:announcement) }
  it { should validate_presence_of :button }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of :link }

  context 'when Announcement created' do
    it ("should have button")  { expect(subject.button).not_to eq(nil) }
    it ("should have body")  { expect(subject.body).not_to eq(nil) }
    it ("should have link")  { expect(subject.link).not_to eq(nil) }
    it ("should have start_date")  { expect(subject.start_date).not_to eq(nil) }
    it ("should have end_date")  { expect(subject.end_date).not_to eq(nil) }
  end

  context 'when using start_date' do
    it "should fail if string format" do
      start_date = "hello"
      expect(start_date).not_to eq(Date.today)
    end
    it "should fail if number format" do
      start_date = 123
      expect(start_date).not_to eq(Date.today)
    end
    it "should pass if Date is today" do
      start_date = Date.today
      expect(start_date).to eq(Date.today)
    end
    it "should fail if Date not today" do
      start_date = Date.today + 1.days
      expect(start_date).not_to eq(Date.today)
    end
  end

  context 'when two date ranges' do
    it "overlap, will not save announcement" do
      FactoryGirl.create(:announcement)  # need to have one persist
      subject = FactoryGirl.build(:announcement)
      binding.pry
      expect(subject.save).to eq(false)
    end
  end

  context 'when two date ranges' do
    it "overlap, again should not save announcement" do
      first = FactoryGirl.create(:announcement)  # need to have one persist
      subject = FactoryGirl.build(:announcement)
      subject.start_date = Date.today + 1.weeks
      subject.end_date = subject.start_date + 1.days
      binding.pry
      expect(subject.save).to eq(false)
    end
  end

  context 'when end_date earlier than start_date' do 
    it "will not save announcement" do 
      subject = FactoryGirl.build(:announcement)
      subject.end_date = subject.start_date - 1.day
      expect(subject.save).to eq(false)
    end
    it "after start_date, will save announcement" do 
      #subject = FactoryGirl.build(:announcement)
      subject.end_date = subject.start_date + 1.day
      expect(subject.save).to eq(true)
    end
  end

  after { Announcement.destroy_all }

end
require 'rails_helper'

describe Announcement do
  let(:announcement) { create(:announcement, start_date: 1.day.from_now, end_date: 5.days.from_now) }

  it 'is invalid without #button' do
    announcement.button = nil
    expect(announcement).not_to be_valid
  end

  it 'is invalid without #body' do
    announcement.body = nil
    expect(announcement).not_to be_valid
  end

  it 'is invalid without #link' do
    announcement.link = nil
    expect(announcement).not_to be_valid
  end

  it 'is invalid without #start_date' do
    announcement.start_date = nil
    expect(announcement).not_to be_valid
  end

  it 'is invalid without #end_date' do
    announcement.end_date = nil
    expect(announcement).not_to be_valid
  end

  context 'validate overlapping dates' do
    before do
      announcement
    end
    it 'is invalid with overlapping dates' do
      announcement_2 = build(:announcement, start_date: 5.days.from_now, body: "another test")
      #expect(announcement_2.valid?).to eq false
      expect(announcement_2).not_to be_valid
    end
  end

  context 'with end_date < start_date' do
    it 'is invalid' do
      announcement.end_date = announcement.start_date - 1.day
      expect(announcement).not_to be_valid
    end
  end
end

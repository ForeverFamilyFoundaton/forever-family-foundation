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

  it 'is invalid with overlapping dates' do
    announcement_2 = create(:announcement, start_date: 3.days.from_now)
    expect(announcement_2).not_to be_valid
  end

  context 'with end_date < start_date' do
    it 'is invalid' do
      announcement.end_date = announcement.start_date - 1.day
      expect(announcement).not_to be_valid
    end
  end
end

RSpec.describe Event do
  before(:all) do
    @events = FactoryBot.create_list(:event, 4)
  end

  after(:all) do
    @events.map(&:destroy)
  end

  it { is_expected.to validate_presence_of :start_time }
  it { is_expected.to validate_presence_of :end_time }
  it { is_expected.to validate_presence_of :title }

  it { is_expected.to allow_mass_assignment_of :start_time }
  it { is_expected.to allow_mass_assignment_of :end_time }
  it { is_expected.to allow_mass_assignment_of :title }
  it { is_expected.to allow_mass_assignment_of :description }
  it { is_expected.to allow_mass_assignment_of :url }

  describe "Upcoming events" do
    let(:upcoming) { Event.upcoming.map(&:start_time) }
    let(:first_time) { upcoming.first.to_i }
    let(:second_time) { upcoming[1].to_i }

    it "should have ascending order" do
      expect(first_time).to be < second_time
    end
  end

  # Need to be careful running this around midnight UTC, start_time and end_time could span days
  describe ".times" do
    let(:date) { Event.new(title: "hello", start_time: Time.now, end_time: Time.now + 1.minute) }

    it "should format with one day" do
      same_date = "#{date.start_time.to_s(:ordinal_date)} " + [date.start_time.strftime("%l:%M %p"), date.end_time.strftime("%l:%M %p")].join(' - ')
      expect(date.times).to eq(same_date)
    end
  end
end

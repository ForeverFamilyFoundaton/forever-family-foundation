RSpec.describe "events/index" do
  # let(:start_time) { Time.now + 1.day }
  # let(:end_time) { start_time + 2.hours }
  before do
    @start_time = Time.now + 1.day
    @end_time = @start_time + 2.hours
    local_event = Event.create! title: 'Local', start_time: @start_time, end_time: @end_time
    remote_event = Event.create! title: 'Local', start_time: @start_time, end_time: @end_time, url: 'somewhereelse.com'
    assign :events, [local_event, remote_event]
  end

  it "should display date only once" do
    date = "#{@start_time.utc.to_s(:ordinal_date)} " + [@start_time.utc.strftime("%l:%M %p"), @end_time.utc.strftime("%l:%M %p")].join(' - ')
    render
    expect(rendered).to include(date)
  end

  it 'links to local site' do
    pending
    render
    expect(rendered).to have_tag(:a, content: 'Local', href: 'events/1')
  end

  it 'links to remote site' do
    pending
    render
    expect(rendered).to have_selector 'a', content: 'Remote', href: 'somewhereelse.com', target: '_blankrake'
  end

end

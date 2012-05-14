require 'spec_helper'

describe "events/index" do
  before do
    start_time = Time.now + 1.day
    end_time = start_time + 2.hours
    local_event = Event.create! title: 'Local', start_time: start_time, end_time: end_time
    remote_event = Event.create! title: 'Local', start_time: start_time, end_time: end_time, url: 'somewhereelse.com'
    assign :events, [local_event, remote_event]
  end

  it 'links to local site' do
    render
    rendered.should have_selector 'a', content: 'Local', href: 'events/1'
  end

  it 'links to remote site' do
    render
    rendered.should have_selector 'a', content: 'Remote', href: 'somewhereelse.com', target: '_blankrake'
  end

end

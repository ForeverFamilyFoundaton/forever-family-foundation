require 'rails_helper'

RSpec.describe "exports/index", :type => :view do
  before(:each) do
    assign(:exports, [
      Export.create!(),
      Export.create!()
    ])
  end

  it "renders a list of exports" do
    render
  end
end

require 'rails_helper'

RSpec.describe "exports/new", :type => :view do
  before(:each) do
    assign(:export, Export.new())
  end

  it "renders new export form" do
    render

    assert_select "form[action=?][method=?]", exports_path, "post" do
    end
  end
end

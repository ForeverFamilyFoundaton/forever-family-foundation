require 'rails_helper'

RSpec.describe "exports/edit", :type => :view do
  before(:each) do
    @export = assign(:export, Export.create!())
  end

  it "renders the edit export form" do
    render

    assert_select "form[action=?][method=?]", export_path(@export), "post" do
    end
  end
end

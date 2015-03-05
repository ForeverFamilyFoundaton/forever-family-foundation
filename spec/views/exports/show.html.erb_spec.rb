require 'rails_helper'

RSpec.describe "exports/show", :type => :view do
  before(:each) do
    @export = assign(:export, Export.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

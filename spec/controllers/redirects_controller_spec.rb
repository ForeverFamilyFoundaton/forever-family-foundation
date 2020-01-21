RSpec.describe RedirectsController do

  it "radio should redirect" do
    expect(get: 'radio').to be_routable
  end
  it "XYZ should not redirect" do
    expect(get: 'XYZ').not_to be_routable
  end
end

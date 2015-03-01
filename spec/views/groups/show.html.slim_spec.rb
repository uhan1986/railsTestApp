require 'rails_helper'

RSpec.describe "groups/show", :type => :view do
  before(:each) do
    @group = assign(:group, Group.create!(
      :group_account => "Group Account",
      :group_name => "Group Name",
      :hashed_password => "Hashed Password",
      :description => "MyText",
      :deleted => false,
      :suspended => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Group Account/)
    expect(rendered).to match(/Group Name/)
    expect(rendered).to match(/Hashed Password/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end

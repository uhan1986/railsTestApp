require 'rails_helper'

RSpec.describe "groups/index", :type => :view do
  before(:each) do
    assign(:groups, [
      Group.create!(
        :group_account => "Group Account",
        :group_name => "Group Name",
        :hashed_password => "Hashed Password",
        :description => "MyText",
        :deleted => false,
        :suspended => false
      ),
      Group.create!(
        :group_account => "Group Account",
        :group_name => "Group Name",
        :hashed_password => "Hashed Password",
        :description => "MyText",
        :deleted => false,
        :suspended => false
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", :text => "Group Account".to_s, :count => 2
    assert_select "tr>td", :text => "Group Name".to_s, :count => 2
    assert_select "tr>td", :text => "Hashed Password".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

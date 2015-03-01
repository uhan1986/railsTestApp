require 'rails_helper'

RSpec.describe "groups/new", :type => :view do
  before(:each) do
    assign(:group, Group.new(
      :group_account => "MyString",
      :group_name => "MyString",
      :hashed_password => "MyString",
      :description => "MyText",
      :deleted => false,
      :suspended => false
    ))
  end

  it "renders new group form" do
    render

    assert_select "form[action=?][method=?]", groups_path, "post" do

      assert_select "input#group_group_account[name=?]", "group[group_account]"

      assert_select "input#group_group_name[name=?]", "group[group_name]"

      assert_select "input#group_hashed_password[name=?]", "group[hashed_password]"

      assert_select "textarea#group_description[name=?]", "group[description]"

      assert_select "input#group_deleted[name=?]", "group[deleted]"

      assert_select "input#group_suspended[name=?]", "group[suspended]"
    end
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    group_account "MyString"
    group_name "MyString"
    hashed_password "MyString"
    description "MyText"
    deleted false
    suspended false
    created_at "2015-02-25 00:58:05"
    updated_at "2015-02-25 00:58:05"
  end
end

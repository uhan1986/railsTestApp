class Users::RegistrationForm
  include ActiveModel::Model


  attr_accessor :group, :user

  def initialize(user = nil, group = nil)
    @user = user
    @group = group

    @user ||= User.new()
    @group ||= Group.new()
  end



  def assign_attributes(params={})
    @params = params
    group.assign_attributes(group_params)
    user.assign_attributes(user_params)
  end


  def save
    ActiveRecord::Base.transaction do
      group.save!
      user.save!

    end
  end



  private
  def group_params
    @params.require(:group).permit(
      :group_name, :description
    )
  end

  def user_params
    @params.require(:user).permit(
      :account, :email, :password, :password_confirmation, :permission
    )
  end

end

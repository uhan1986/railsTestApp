class Group < ActiveRecord::Base
	include PasswordHolder

	has_many :user

	
end

class User < ActiveRecord::Base
	include PasswordHolder
end
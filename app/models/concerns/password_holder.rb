module PasswordHolder
	extend ActiveSupport::Concern

	def password=(row_password)
		if row_password.kind_of?(String)
			self.hashed_password = BCrypt::Password.create(row_password)
		elsif row_password.nil?
			self.hashed_password = nil
		end
	end
end
				
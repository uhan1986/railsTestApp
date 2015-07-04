class User < ActiveRecord::Base
	include PasswordHolder

	belongs_to :group

	enum permission: {
		user: 100,
		vice_admin: 700,
		admin: 900
	}

	devise :database_authenticatable, :registerable,
					:recoverable, :rememberable, :trackable,
					:validatable, :authentication_keys => [:login_account]

	attr_accessor :login_account

	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login_account = conditions.delete(:login_account)
			acc = where(conditions).where(["account = :value OR email = :value", { value: login_account }]).first
		else
			acc = where(conditions).first
		end
	end

	def belongs_to_group?
		!self.nil?	&& !self.group_id.nil?
	end

	def is_event_editable?
		self.is_group_admin? || self.is_group_vice_admin?
	end

	def is_member_editable?
		self.is_group_admin? || self.is_group_vice_admin?
	end

	def is_group_admin?
		self.belongs_to_group? && self.admin?
	end

	def is_group_vice_admin?
		self.belongs_to_group? && self.vice_admin?
	end

end

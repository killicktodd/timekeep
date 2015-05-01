class User < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true

	def full_name
		if first_name.present? and last_name.present?
			[first_name, last_name].join(" ")
		else name
		end	
	end

	def name
		first_name || username || email
		if first_name.present?
				first_name
		elsif username.present?
				username
		else
				email
		end
	end
end

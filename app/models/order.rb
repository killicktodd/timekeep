class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :watch
	validates :stripe_token, presence: true
end

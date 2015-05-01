class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :watch
	validates :stripe_token, presence: true

	def save_and_charge
		Stripe.api_key = Rails.application.secrets.stripe_secret_key

		Stripe::Charge.create(
		  :amount => 400,
		  :currency => "gbp",
		  :source => "tok_15xeXRDdG45x16nLgJrvol1Y", # obtained with Stripe.js
		  :description => "Charge for test@example.com"
		)	
	end
end

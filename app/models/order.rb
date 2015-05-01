class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :watch
	validates :stripe_token, presence: true

	def save_and_charge
		Stripe.api_key = Rails.application.secrets.stripe_secret_key

		Stripe::Charge.create(
		  :amount => amount,
		  :currency => "gbp",
		  :source => stripe_token, # obtained with Stripe.js
		  :description => "#{user.email} charged for #{watch.name}"
		)	

		self.save

	rescue Stripe::CardError => e
		body = e.json_body
		err = body[:error]
		if err[:message] == "Your card has insufficient funds" or err[:message] == "Your card was declined"
			errors.add :base, err[:message]
		else
			errors.add :base, "There was a problem charding your card. Try contacting help@timekeep.com"
		end
		false
	end

	def amount
		watch.price_in_pence 
	end
end

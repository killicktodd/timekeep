class Watch < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :brand, presence: true
	validates :price_in_pence, numericality: {greater_than_or_equal_to:3999}
end

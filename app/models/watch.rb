class Watch < ActiveRecord::Base
	belongs_to :user
	has_many :orders

	has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.svg"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
	validates :user, presence: true
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :brand, presence: true
	validates :price_in_pence, numericality: {greater_than_or_equal_to:3999}

	def price
		price_in_pence.to_f / 100
	end
end

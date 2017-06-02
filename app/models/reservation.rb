class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	validates :start_date, :end_date, presence: {message: "Please fill-in all fields" }
	validates_numericality_of :num_of_nights, :allow_nil => false, :greater_than => 0 
	
	def num_of_nights
		(self.end_date - self.start_date).to_i
	end
end

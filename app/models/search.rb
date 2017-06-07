class Search < ApplicationRecord

	def search_listings

		listings = Listing.all
		results = []
	
		
		if self.keyword.present? 
			self.keyword = self.keyword.downcase
			results << listings.where(["lower(name) LIKE?", "%#{keyword}%"]) 
			results << listings.where(["lower(property_type) LIKE?", "%#{keyword}%"])
			results << listings.where(["lower(state) LIKE?", "%#{keyword}%"])
			results << listings.where(["lower(country) LIKE?", "%#{keyword}%"])
			listings = results[0]
		end
		
		listings = listings.where(["property_type LIKE?",property_type]) if self.property_type.present? 
		listings = listings.where(["state LIKE?",state]) if self.state.present? 
		listings = listings.where(["country LIKE?",country]) if self.country.present?
		listings = listings.where(["no_bed >= ?", no_bed]) if self.no_bed.present?
		listings = listings.where(["max_guest >= ?", no_guest]) if self.no_guest.present?
		listings = listings.where(["price_per_day >= ?", min_price]) if self.min_price.present?
		listings = listings.where(["price_per_day <= ?", max_price]) if self.max_price.present?
		listings = listings.where(smoker: true) if self.smoker == true
		listings = listings.where(pets: true) if self.pets == true
		listings = listings.where(instant_book: true) if self.instant_book == true



# Listing.where(["lower(name || property_type || state || country) LIKE?", "%#{keyword}%"]) if self.keyword.present?
		return listings
	end
end
	
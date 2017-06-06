class Search < ApplicationRecord

	def search_listings
		listings = Listing.all

		listings = listings.where(["name LIKE?", "#{keyword}"]) if self.keyword.present?
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

		return listings
	end
end

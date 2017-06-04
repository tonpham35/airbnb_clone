class Search < ApplicationRecord

	def search_listings
		listings = Listing.all

		listings = listings.where(["name LIKE?", "#{keyword}"]) if keyword.present?
		listings = listings.where(["property_type LIKE?",property_type]) if property_type.present? 
		listings = listings.where(["state LIKE?",state]) if state.present? 
		listings = listings.where(["country LIKE?",country]) if country.present?
		listings = listings.where(["no_bed >= ?", no_bed]) if no_bed.present?
		listings = listings.where(["max_guest >= ?", no_guest]) if no_guest.present?
		listings = listings.where(["price_per_day >= ?", min_price]) if min_price.present?
		listings = listings.where(["price_per_day <= ?", max_price]) if max_price.present?
		listings = listings.where(smoker = 1) if smoker == true
		listings = listings.where(pets = 1) if pets == true
		listings = listings.where(instant_book = 1) if instant_book == true

		return listings
	end
end

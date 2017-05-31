json.extract! listing, :id, :user, :address1, :address2, :postalcode, :state, :country, :no_bed, :no_room, :max_guest, :price_per_day, :currency, :content, :smoker, :pets, :instant_book, :property_type, :name, :created_at, :updated_at
json.url listing_url(listing, format: :json)

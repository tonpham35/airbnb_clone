json.extract! search, :id, :keyword, :state, :country, :no_bed, :no_room, :no_guest, :min_price, :max_price, :smoker, :pets, :instant_book, :property_type, :created_at, :updated_at
json.url search_url(search, format: :json)

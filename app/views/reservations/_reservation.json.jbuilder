json.extract! reservation, :id, :user_id, :listing_id, :total_price, :currency, :start_date, :end_date, :message, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)

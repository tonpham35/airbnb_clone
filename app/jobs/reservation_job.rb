class ReservationJob < ApplicationJob
  queue_as :default

  def perform(reservation_id, listing_id)
  	reservation = Reservation.find(reservation_id)
  	listing = Listing.find(listing_id)
    ReservationMailer.booking_email(reservation.user, listing.user, reservation.id).deliver_now
  end
end

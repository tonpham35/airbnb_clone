class ReservationMailer < ApplicationMailer
	default from: 'tonconnections@gmail.com'

	def booking_email(customer, host, reservation_id)
		@customer = customer
		@host = host
		@reservation_id = reservation_id
		# @url  = 'http://localhost:3000/reservations/"#{@reservation_id}"'
    	mail(to: @host.email, subject: 'You have a New Booking')
   	end
end

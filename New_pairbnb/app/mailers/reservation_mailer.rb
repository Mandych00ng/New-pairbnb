class ReservationMailer < ApplicationMailer
	def booking_email(reservation)
		@reservation = reservation
		@user = @reservation.user
		@listing = @reservation.listing
		@host = @listing.user
		mail(to: @host.email, subject: 'Someone booked your property')	
	end
end

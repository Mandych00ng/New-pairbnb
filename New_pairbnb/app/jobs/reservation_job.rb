class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(reservation)
    ReservationMailer.booking_email(reservation).deliver_now
  end
end

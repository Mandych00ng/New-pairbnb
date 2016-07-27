class PaymentsController < ApplicationController

  def create
  	reservation = Reservation.find(params[:payment][:reservation_id])
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: "#{reservation.price}",
      payment_method_nonce: params[:payment_method_nonce]
    )
  	if result.success?
  		flash[:message] = "Payment successful!!!"
  		redirect_to listing_path(reservation.listing_id)
  	else
  		flash[:message] = "Failed, please pay again"
  		redirect_to reservations_path
  	end

  end

end

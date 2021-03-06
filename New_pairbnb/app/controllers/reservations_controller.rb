class ReservationsController < ApplicationController

	def index
		@reservations = Reservation.find_by(listing_id: params[:listing_id])
	end

	def show
		@user = User.find(current_user.id)
	    @client_token = Braintree::ClientToken.generate
	    @reservation = Reservation.find(params[:id])
	    @payment = Payment.new
	end

	def new
		
	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		@reservation.price = calculate_price(@reservation) 
		if @reservation.save
			ReservationJob.perform_later(@reservation)
			redirect_to @reservation
		else
			flash[:notice] = "Dates you chose are occupied, choose again"
			redirect_to listing_path(@reservation.listing_id) 
		end
	end

	def edit
		
	end

	def update
		@reservation = Reservation.find_by(user_id: current_user.id)
		@update = @reservation.update(reservation_params)
		if @update.save
			redirect_to reservation_path
		else
			flash[:notice] = "Your reservation is not updated"
			redirect_to reservation_path
		end		
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
	end

private

	def reservation_params
		params.require(:reservation).permit(:listing_id, :user_id, :start_date, :end_date)
	end

	def calculate_price(reservation)
		@start_date = @reservation.start_date
		@end_date = @reservation.end_date
		@price = @reservation.listing.pricing
		return @total = ((@end_date - @start_date)/86400) * @price
	end
end

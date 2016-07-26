class ReservationsController < ApplicationController
	def index
		@reservations = Reservation.find_by(listing_id: params[:listing_id])
	end

	def show
		@user = User.find(current_user.id)
		@reservations = @user.reservations
	end

	def new
		
	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.save
			render :show
		else
			flash[:notice] = "Dates you chose are occupied, choose again"
			redirect_to listing_path(@reservation.listing_id) 
		end
	end

	def edit
		
	end

	def update
		@reservation = Reservation.find_by(user_id: current_user.id)
		@update = @reservation.update(update_params)
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

end

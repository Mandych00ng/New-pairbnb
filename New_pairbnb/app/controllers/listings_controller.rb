class ListingsController < ApplicationController
	def index
			@listings = Listing.all
		
	end

	def show
		
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		if @listing.save 
			redirect_to listings_path
		else
			@msg = 'not saved'
			redirect_to root_path
		end
	end

private
	def listing_params
		params.require(:listing).permit(:name, :location, :pricing)
	end
end

class StaticController < ApplicationController
  def home
  	@listings = Listing.all
  end

  def index
  end
end

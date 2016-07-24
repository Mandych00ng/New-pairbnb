class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	validates :start_date, :end_date, :overlap => {:scope => "listing_id", :message_title => "Sorry someone else booked it ald", :message_content => "Choose another date"}
end

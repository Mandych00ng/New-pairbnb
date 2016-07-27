class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	has_one :payment
	validates :start_date, :end_date, :overlap => {:scope => "listing_id", :message_title => "Sorry someone else booked it ald", :message_content => "Choose another date"}
  validates_date :start_date, :after => lambda { DateTime.now }
  validates_date :end_date, :after => lambda { :start_date }

end

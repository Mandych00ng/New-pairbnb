class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	acts_as_taggable
	mount_uploaders :images, ImageUploader

	def self.search(search)
	  if search
	    find(:location, :conditions => ['location LIKE ?', "%#{search}%"])
	  else
	    Listing.all
	  end
	end
end

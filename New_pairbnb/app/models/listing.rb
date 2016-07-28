class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	acts_as_taggable
	mount_uploaders :images, ImageUploader
	searchkick

	def search_data
    {
      name: name,
      location: location,
      user_id: user,
      tag_list: tags
    }
  end

end

class Event < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged

	belongs_to :organizers, class_name: "User"

	def slug_candidates
		[
			:title,
			[:title, :location],
		]
	end
end

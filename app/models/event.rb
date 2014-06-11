class Event < ActiveRecord::Base
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged
    
    has_many :taggings
    has_many :tags, through: :taggings

	belongs_to :organizers, class_name: "User"

	def slug_candidates
		[
			:title,
			[:title, :location],
		]
	end

	def all_tags=(names)
		self.tags = names.split(",").map do |t|
			Tag.where(name: t.strip).first_or_create!
		end
	end

	def all_tags
		tags.map(&:name).join(", ")
	end
	
	def self.tagged_with(name)
		Tag.find_by_name!(name).events
	end
end

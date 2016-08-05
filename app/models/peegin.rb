class Peegin < ActiveRecord::Base
	belongs_to :user
	before_create :generate_permalink
	acts_as_votable
	
	def to_param
		permalink
	end



	private

	def generate_permalink
		pattern=self.title.parameterize
		duplicates = Peegin.where(permalink: pattern)

		if duplicates.present?
			self.permalink = "#{pattern}-#{duplicates.count+1}"
		else
			self.permalink = self.title.parameterize
		end

	end

end

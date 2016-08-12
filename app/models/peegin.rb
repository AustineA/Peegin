class Peegin < ActiveRecord::Base
	searchkick
	belongs_to :user
	before_create :generate_permalink
	acts_as_votable

	validates_presence_of :title, :meaning, :example, { :message => "Content cannot be blank" }
	validates :title, :length => { :maximum => 50}
	validates :meaning, :length => { :maximum => 500}
	validates :example, :length => { :maximum => 150}

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

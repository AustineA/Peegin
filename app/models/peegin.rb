class Peegin < ActiveRecord::Base
	searchkick
	belongs_to :user
	before_create :generate_permalink
	acts_as_votable
	is_impressionable
	include Randomable

	validates_presence_of :title, :meaning, :example, :synonyms, { :message => "cannot be blank" }
	validates :title, :length => { :maximum => 50}
	validates :meaning, :length => { :maximum => 500}
	validates :example, :length => { :maximum => 150}
	validates :origin, :length => { :maximum => 50}
	validates :synonyms, :length => { :maximum => 50}


	#scope :home, -> { where(front_page: true) }
	scope :phrase, -> { where(basic_phrase: true)}
	scope :wod, -> { where(word_of_the_day: true)}
	scope :home, -> { where(basic_phrase: false) }
	scope :clean, -> { where(clean: true) }

	def self.set_front
		Peegin.home.each{ |e| e.update_attributes(front_page: false)}
		Peegin.all.sample(100).each{ |e| e.update_attributes(front_page: true)}
	end


	def to_param
		permalink
	end

	private

	def generate_permalink
		pattern=self.title.parameterize
		duplicates = Peegin.where('permalink like ?', "%#{pattern}%")

		if duplicates.present?
			self.permalink = "#{pattern}-#{duplicates.count+1}"
		else
			self.permalink = self.title.parameterize
		end

	end

end

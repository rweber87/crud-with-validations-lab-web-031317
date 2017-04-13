class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :released, inclusion: { in: [true, false] }
	validates_uniqueness_of :title, {:scope => [:artist_name, :release_year]}
	with_options if: :released? do |song|
		song.validates :release_year, presence: true
		song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year}
	end

	
	

	private

	def is_released?
		 errors.add(:release, "Message") if (self.released && self.release_year.empty?)
	end

	# def valid_release_year_without
		
	# end





	
end


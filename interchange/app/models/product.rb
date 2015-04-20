class Product < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true, length: {minimum: 6}, uniqueness: true
	validates :description, presence: true, length: {minimum: 6}
	validates :state, presence: true, length: {minimum: 6}
	before_save :set_visits_count

	def update_visits_count
		#self.save if self.visits_count.nil?
		self.update(visits_count: self.visits_count + 1)
	end
	private

	def set_visits_count
		self.visits_count ||= 0
	end
end

class Product < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true, length: {minimum: 6}, uniqueness: true
	validates :description, presence: true, length: {minimum: 6}
	validates :state, presence: true, length: {minimum: 6}
end

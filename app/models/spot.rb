class Spot < ApplicationRecord
	acts_as_paranoid

	#has_many :posts
	belongs_to :category

	attachment :image
end

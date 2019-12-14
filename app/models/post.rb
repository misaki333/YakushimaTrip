class Post < ApplicationRecord
	#belongs_to :spot
	belongs_to :user
	has_many :post_images, dependent: :destroy
	accepts_nested_attributes_for :post_images
	accepts_attachments_for :post_images, attachment: :image
end
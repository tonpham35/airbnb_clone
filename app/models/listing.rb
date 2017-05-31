class Listing < ApplicationRecord
	belongs_to :user
	has_many :reservations, dependent: :destroy
	serialize :photos, Array
	mount_uploaders :photos, ImageUploader

	validates :address1, :country, :price_per_day, :currency,  presence: true

	paginates_per 15
end
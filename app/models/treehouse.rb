class Treehouse < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :location, presence: true
  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, inclusion: { in: [1, 2, 3, 4] }

  # geocoded_by :location
  # after_validation :geocode, if: :location_changed?
end

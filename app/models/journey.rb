class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :treehouse

  def total_price
    @total_price = (Date.parse[:checkout] - Date.parse[:checkin]) * :price_per_night
  end
end

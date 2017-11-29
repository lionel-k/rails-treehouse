class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :treehouse

  def total_price
    diff_days = Date.parse(self.checkout).mjd - Date.parse(self.checkin).mjd
    self.treehouse.price_per_night * diff_days
  end
end

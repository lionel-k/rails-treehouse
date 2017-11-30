class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :treehouse


  def self.hostings(user)
    owner_treehouses = Treehouse.where(user: user)
    hostings = []
    Journey.all.each do |journey|
      hostings << journey if journey.treehouse.user == user
    end
    return hostings
  end

  def total_price
    diff_days = Date.parse(self.checkout).mjd - Date.parse(self.checkin).mjd
    self.treehouse.price_per_night * diff_days
  end
end

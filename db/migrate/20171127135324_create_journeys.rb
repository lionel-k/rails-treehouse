class CreateJourneys < ActiveRecord::Migration[5.1]
  def change
    create_table :journeys do |t|
      t.string :checkin
      t.string :checkout
      t.string :guests_number
      t.boolean :is_confirmed
      t.references :user, foreign_key: true
      t.references :treehouse, foreign_key: true

      t.timestamps
    end
  end
end

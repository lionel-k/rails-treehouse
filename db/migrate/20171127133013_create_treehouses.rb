class CreateTreehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :treehouses do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :price_per_night
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

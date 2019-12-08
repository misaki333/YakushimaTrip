class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.integer :spot_id
      t.integer :itinerary_id
      t.datetime :time
      t.string :plan

      t.timestamps
    end
  end
end

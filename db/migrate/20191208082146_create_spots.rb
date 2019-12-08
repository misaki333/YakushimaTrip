class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.integer :category_id
      t.integer :post_id
      t.string :name
      t.string :image_id
      t.string :address
      t.text :content
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

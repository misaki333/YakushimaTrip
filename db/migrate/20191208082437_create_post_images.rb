class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.string :post_image_name

      t.timestamps
    end
  end
end

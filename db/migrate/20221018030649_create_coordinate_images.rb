class CreateCoordinateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :coordinate_images do |t|
      t.string :image, null: false
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

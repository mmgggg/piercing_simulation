class AddDetailsToCoordinateImages < ActiveRecord::Migration[6.1]
  def change
    add_column :coordinate_images, :image_url, :text
  end
end

class RenameImageUrlColumnToCoordinateImages < ActiveRecord::Migration[6.1]
  def change
    rename_column :coordinate_images, :image_url, :for_post_image_url
  end
end

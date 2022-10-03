class RenameNameColumnToPierceImages < ActiveRecord::Migration[6.1]
  def change
    rename_column :pierce_images, :name, :pierce_image_name
  end
end

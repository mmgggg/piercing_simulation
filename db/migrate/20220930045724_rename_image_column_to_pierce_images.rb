class RenameImageColumnToPierceImages < ActiveRecord::Migration[6.1]
  def change
    rename_column :pierce_images, :image, :pierce_image
  end
end

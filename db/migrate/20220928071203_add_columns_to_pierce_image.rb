class AddColumnsToPierceImage < ActiveRecord::Migration[6.1]
  def change
    add_column :pierce_images, :image, :string
    add_column :pierce_images, :name, :string
  end
end

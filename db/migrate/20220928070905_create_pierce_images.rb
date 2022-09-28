class CreatePierceImages < ActiveRecord::Migration[6.1]
  def change
    create_table :pierce_images do |t|
      

      t.timestamps
    end
  end
end

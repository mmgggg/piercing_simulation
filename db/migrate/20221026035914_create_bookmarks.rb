class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :coordinate_image, null: false, foreign_key: true

      t.timestamps
    end
    add_index  :bookmarks, [:user_id, :coordinate_image_id], unique: true
  end
end
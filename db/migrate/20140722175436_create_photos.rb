class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :tag
      t.string :album

      t.timestamps
    end
  end
end

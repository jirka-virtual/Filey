class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.date :date_from
      t.date :date_to

      t.timestamps
    end
  end
end

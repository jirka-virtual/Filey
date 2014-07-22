class AddDocToAlbum < ActiveRecord::Migration
  def self.up
    add_attachment :albums, :doc
  end

  def self.down
    remove_attachment :albums, :doc
  end
end

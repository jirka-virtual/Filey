class AddDocToPhoto < ActiveRecord::Migration
  def self.up
    add_attachment :photos, :doc
  end

  def self.down
    remove_attachment :photos, :doc
  end
end

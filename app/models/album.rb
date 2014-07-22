class Album < ActiveRecord::Base
  require 'zip'

  has_many :photos

  has_attached_file :doc

  do_not_validate_attachment_file_type :doc

  #after_create :extract_photos

  def extract_photos
    Zip::File.open(self.doc.path) do |zip_file|
      # Handle entries one by one
      zip_file.each do |entry|
        # Extract to file/directory/symlink


        if entry.name.downcase =~ /^[^._]\w*.(png|jpg|gif)$/
          filename = "#{Dir::tmpdir}/temp_#{entry.name}"
          entry.extract(filename)
          p = File.open(filename, 'r+')
          Photo.create!(name: entry.name, doc: p, album_id: self.id)
          #delete the temp file
          FileUtils.remove_file(filename)
        end
        
        # Read into memory
        #content = entry.get_input_stream.read
      end

      # Find specific entry
      #entry = zip_file.glob('*.csv').first
      #puts entry.get_input_stream.read
    end
  end
end

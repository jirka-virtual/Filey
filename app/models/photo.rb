class Photo < ActiveRecord::Base
	belongs_to :album

	has_attached_file :doc, :styles => { :medium => "300x300>", :thumb => "100x100>" }#, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :doc, :content_type => /\Aimage\/.*\Z/

end

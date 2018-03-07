class Doner < ActiveRecord::Base
	belongs_to :user
	# paperclip
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300#", small: "200x200#",thumb: "150x150#" }, default_url: "/system/doners/images/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  	# !paperclip

	def self.search(search)
		if search
			where("name LIKE ? OR id = ?", "%#{search}%",search).order('created_at DESC')
		else
			all
		end	
	end

end

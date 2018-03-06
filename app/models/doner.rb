class Doner < ActiveRecord::Base
	belongs_to :user

	def self.search(search)
		if search
			where("name LIKE ? OR id = ?", "%#{search}%",search).order('created_at DESC')
		else
			all
		end
	  
	
	end
end

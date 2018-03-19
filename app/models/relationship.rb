class Relationship < ActiveRecord::Base
	belongs_to :user
	belongs_to :donor

	paginates_per 5

	def self.donorrelationshipssearch(search)
		if search
			where("donor_id = ?",search)
		else
			all
		end	
	end


	


	
end

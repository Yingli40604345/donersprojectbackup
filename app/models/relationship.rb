class Relationship < ActiveRecord::Base
	belongs_to :user
	belongs_to :donor


	validates :donor_id,:target, inclusion: {in: Donor.all.map(&:id), message: "%{value} is not a valid id."}
	paginates_per 5

	def self.donorrelationshipssearch(search)
		if search
			where("donor_id = ?",search)
		else
			all
		end	
	end


	


	
end

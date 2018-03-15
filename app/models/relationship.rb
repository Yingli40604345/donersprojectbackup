class Relationship < ActiveRecord::Base
	belongs_to :user
	belongs_to :doner

	paginates_per 5


	
end

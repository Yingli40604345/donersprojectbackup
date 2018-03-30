class Donor < ActiveRecord::Base
	belongs_to :user
	has_many :relationships
	# paperclip
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300#", small: "150x150#",thumb: "80x80#" },  default_url: "/system/donors/images/missing_:style.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  	# !paperclip
  	paginates_per 6
  	
	def self.search(search)
		if search
			where("name LIKE ? OR id = ?", "%#{search}%",search).order('created_at DESC')
		else
			all
		end	
	end

	def self.searchdonationgoal(search)
		if search
			where("donation_goal > ?", search).order('created_at DESC')
		else
			all
		end	
	end

	def self.searchdonationytd(search)
		if search
			where("donation_YTD > ?", search).order('created_at DESC')
		else
			all
		end	
	end

	def self.searchdonor(search)
		if search
			where("id = ?",search)
		else
			all
		end	
	end

	def self.searchdonorname(search)
		if search
			where("name LIKE ? OR id = ?", "%#{search}%",search).order('created_at DESC')
		else
			all
		end	
	end

	# def self.donornamesearch(search)
	# 	if search
	# 		where("name LIKE ?", "%#{search}%").order('created_at DESC')
	# 	else
	# 		all
	# 	end	
	# end


	




end

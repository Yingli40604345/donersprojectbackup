class AutocompletenamesController < ApplicationController
	def index
		@autocompletenames=Donor.order(:name).where("name like ?","%#{params[:term]}%")
		render json: @autocompletenames.map(&:name)
	end
end

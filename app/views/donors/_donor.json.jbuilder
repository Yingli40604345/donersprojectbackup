json.extract! donor, :id, :name, :age, :gender, :race, :religion, :networth, :employer, :position, :education, :associations, :military, :location, :zip, :description, :life_event, :donation_goal, :donation_YTD, :created_at, :updated_at
json.url donor_url(donor, format: :json)

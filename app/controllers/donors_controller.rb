class DonorsController < ApplicationController
  before_action :set_donor, only: [:show, :edit, :update, :destroy]

  # GET /donors
  # GET /donors.json
  def index

   
    if params[:search]
      @donors=current_user.donors.search(params[:search]).order('created_at DESC').page params[:page]
    
    elsif params[:donationgoal]
      @donors=current_user.donors.searchdonationgoal(params[:donationgoal]).order('created_at DESC').page params[:page]
    elsif params[:donationytd]
      @donors=current_user.donors.searchdonationytd(params[:donationytd]).order('created_at DESC').page params[:page]
    else
      
      @donors=current_user.donors.order('created_at DESC').page params[:page]
    end


    

  end

  # GET /donors/1
  # GET /donors/1.json
  def show
    @targethash=@donor.relationships.map{|a| a.slice(:target)}
    @targetidvalues=@targethash.map{|x| x[:target]}
    @nodeid=@targetidvalues.push(@donor.id)

    @donors=Donor.where(id: @nodeid)
    # @relationshiphash1=@donor.relationships.as_json.map{|a| a.slice('donor_id', 'target','link_description')}
    @relationship_hash_array= @donor.relationships.collect{|relationship| {from: relationship.donor_id, to: relationship.target,label: relationship.link_description}}.to_json
    # @donor_hash_array= @donors.collect{|donor| {id: donor.id, label: donor.name, shape: 'circularImage'}}.to_json
    @donor_hash_array= @donors.collect{|donor| {id: donor.id, label: donor.name, shape: 'circularImage',  image: donor.image.url(:thumb)}}.to_json
  end

  # GET /donors/new
  def new
    @donor = current_user.donors.build
  end

  # GET /donors/1/edit
  def edit
  end

  # POST /donors
  # POST /donors.json
  def create
    @donor = current_user.donors.build(donor_params)

    respond_to do |format|
      if @donor.save
        format.html { redirect_to @donor, notice: 'Donor was successfully created.' }
        format.json { render :show, status: :created, location: @donor }
      else
        format.html { render :new }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donors/1
  # PATCH/PUT /donors/1.json
  def update
    respond_to do |format|
      if @donor.update(donor_params)
        format.html { redirect_to @donor, notice: 'Donor was successfully updated.' }
        format.json { render :show, status: :ok, location: @donor }
      else
        format.html { render :edit }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donors/1
  # DELETE /donors/1.json
  def destroy
    @donor.destroy
    respond_to do |format|
      format.html { redirect_to donors_url, notice: 'Donor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donor
      @donor = Donor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donor_params
      params.require(:donor).permit(:name, :age, :gender, :race, :religion, :networth, :employer, :position, :education, :associations, :military, :location, :zip, :description, :life_event, :donation_goal, :donation_YTD, :image)
    end
end

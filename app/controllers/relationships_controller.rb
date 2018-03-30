class RelationshipsController < ApplicationController
  before_action :set_relationship, only: [:show, :edit, :update, :destroy]

  # GET /relationships
  # GET /relationships.json
  def index

    if params[:donorid]
      @relationships=current_user.relationships.donorrelationshipssearch(params[:donorid]).order('created_at DESC').page params[:page]
    elsif params[:donorname]
      @relationships= current_user.relationships.where(donor_id: Donor.searchdonorname(params[:donorname]).map(&:id)).order('donor_id').page params[:page]
    else   
      @relationships = current_user.relationships.order('created_at DESC').page params[:page]
    end
    
  end

  # GET /relationships/1
  # GET /relationships/1.json
  def show
  end

  # GET /relationships/new
  def new
    @relationship = current_user.relationships.build 
  end

  # GET /relationships/1/edit
  def edit
    @autocompletenames=Donor.order(:name).map(&:name)
    
  end

  # POST /relationships
  # POST /relationships.json
  def create
    @relationship = current_user.relationships.build(relationship_params)

    respond_to do |format|
      if @relationship.save
        format.html { redirect_to @relationship, notice: 'Relationship was successfully created.' }
        format.json { render :show, status: :created, location: @relationship }
      else
        format.html { render :new }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relationships/1
  # PATCH/PUT /relationships/1.json
  def update
    respond_to do |format|
      if @relationship.update(relationship_params)
        format.html { redirect_to @relationship, notice: 'Relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @relationship }
      else
        format.html { render :edit }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.json
  def destroy
    @relationship.destroy
    respond_to do |format|
      format.html { redirect_to relationships_url, notice: 'Relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def searchdonor
    case
    when params[:donornameautocomplete]
      @donor=Donor.searchdonorname(params[:donornameautocomplete])
    when params[:donorid]
      @donor=Donor.searchdonor(params[:donorid]) 
    when params[:donornodeid]
      @donor=Donor.searchdonor(params[:donornodeid])      
    end
  end

  



  # def searchdonornameforrelationship
  #    @searchdonorid=Donor.donornamesearch(params[:donorname])[0].id
  #    byebug
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relationship_params
      params.require(:relationship).permit(:donor_id, :target, :link_description)
    end
end

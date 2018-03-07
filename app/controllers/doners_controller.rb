class DonersController < ApplicationController
  before_action :set_doner, only: [:show, :edit, :update, :destroy]

  # GET /doners
  # GET /doners.json
  def index
   
    if params[:search]
      @doners=Doner.search(params[:search]).order('created_at DESC').page params[:page]
    else
      
      @doners=Doner.order('created_at DESC').page params[:page]
    end
  end

  # GET /doners/1
  # GET /doners/1.json
  def show
  end

  # GET /doners/new
  def new
    @doner = current_user.doners.build
  end

  # GET /doners/1/edit
  def edit
  end

  # POST /doners
  # POST /doners.json
  def create
    @doner = current_user.doners.build(doner_params)

    respond_to do |format|
      if @doner.save
        format.html { redirect_to @doner, notice: 'Doner was successfully created.' }
        format.json { render :show, status: :created, location: @doner }
      else
        format.html { render :new }
        format.json { render json: @doner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doners/1
  # PATCH/PUT /doners/1.json
  def update
    respond_to do |format|
      if @doner.update(doner_params)
        format.html { redirect_to @doner, notice: 'Doner was successfully updated.' }
        format.json { render :show, status: :ok, location: @doner }
      else
        format.html { render :edit }
        format.json { render json: @doner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doners/1
  # DELETE /doners/1.json
  def destroy
    @doner.destroy
    respond_to do |format|
      format.html { redirect_to doners_url, notice: 'Doner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doner
      @doner = Doner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doner_params
      params.require(:doner).permit(:name, :age, :gender, :race, :religion, :networth, :employer, :position, :education, :associations, :military, :location, :zip, :description, :life_event, :donation_goal, :donation_YTD, :image)
    end
end

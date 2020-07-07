class BlvesController < ApplicationController
  before_action :set_blf, only: [:show, :edit, :update, :destroy]

  # GET /blves
  # GET /blves.json
  def index
    @blves = Blf.all 
    @sps = 45
    case  Blf.where(:status => "hangup").count
    when 1
      @sps = 15
    when 2
      @sps = 20
    when 3
      @sps = 25
    end
    
  end

  # GET /blves/1
  # GET /blves/1.json
  def show
  end

  # GET /blves/new
  def new
    @blf = Blf.new
  end

  # GET /blves/1/edit
  def edit
  end

  # POST /blves
  # POST /blves.json
  def create
    @blf = Blf.new(blf_params)

    respond_to do |format|
      if @blf.save
        format.html { redirect_to @blf, notice: 'Blf was successfully created.' }
        format.json { render :show, status: :created, location: @blf }
      else
        format.html { render :new }
        format.json { render json: @blf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blves/1
  # PATCH/PUT /blves/1.json
  def update
    respond_to do |format|
      if @blf.update(blf_params)
        format.html { redirect_to @blf, notice: 'Blf was successfully updated.' }
        format.json { render :show, status: :ok, location: @blf }
      else
        format.html { render :edit }
        format.json { render json: @blf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blves/1
  # DELETE /blves/1.json
  def destroy
    @blf.destroy
    respond_to do |format|
      format.html { redirect_to blves_url, notice: 'Blf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blf
      @blf = Blf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blf_params
      params.require(:blf).permit(:uid, :status, :direction, :other_leg, :other_leg_domain, :rank, :uuid)
    end
end

class StatspsController < ApplicationController
  before_action :set_statsp, only: [:show, :edit, :update, :destroy]

  # GET /statsps
  # GET /statsps.json
  def index
    @statsps = Statsp.all
  end

  # GET /statsps/1
  # GET /statsps/1.json
  def show
  end

  # GET /statsps/new
  def new
    @statsp = Statsp.new
  end

  # GET /statsps/1/edit
  def edit
  end

  # POST /statsps
  # POST /statsps.json
  def create
    @statsp = Statsp.new(statsp_params)

    respond_to do |format|
      if @statsp.save
        format.html { redirect_to @statsp, notice: 'Statsp was successfully created.' }
        format.json { render :show, status: :created, location: @statsp }
      else
        format.html { render :new }
        format.json { render json: @statsp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statsps/1
  # PATCH/PUT /statsps/1.json
  def update
    respond_to do |format|
      if @statsp.update(statsp_params)
        format.html { redirect_to @statsp, notice: 'Statsp was successfully updated.' }
        format.json { render :show, status: :ok, location: @statsp }
      else
        format.html { render :edit }
        format.json { render json: @statsp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statsps/1
  # DELETE /statsps/1.json
  def destroy
    @statsp.destroy
    respond_to do |format|
      format.html { redirect_to statsps_url, notice: 'Statsp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statsp
      @statsp = Statsp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statsp_params
      params.require(:statsp).permit(:countreg, :freeoper, :newsps, :abonqueue)
    end
end

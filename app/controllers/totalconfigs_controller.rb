class TotalconfigsController < ApplicationController
  before_action :set_totalconfig, only: [:show, :edit, :update, :destroy]

  # GET /totalconfigs
  # GET /totalconfigs.json
  def index
    @totalconfigs = Totalconfig.all
  end

  # GET /totalconfigs/1
  # GET /totalconfigs/1.json
  def show
  end

  # GET /totalconfigs/new
  def new
    @totalconfig = Totalconfig.new
  end

  # GET /totalconfigs/1/edit
  def edit
  end

  # POST /totalconfigs
  # POST /totalconfigs.json
  def create
    @totalconfig = Totalconfig.new(totalconfig_params)

    respond_to do |format|
      if @totalconfig.save
        format.html { redirect_to @totalconfig, notice: 'Totalconfig was successfully created.' }
        format.json { render :show, status: :created, location: @totalconfig }
      else
        format.html { render :new }
        format.json { render json: @totalconfig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /totalconfigs/1
  # PATCH/PUT /totalconfigs/1.json
  def update
    respond_to do |format|
      if @totalconfig.update(totalconfig_params)
        format.html { redirect_to @totalconfig, notice: 'Totalconfig was successfully updated.' }
        format.json { render :show, status: :ok, location: @totalconfig }
      else
        format.html { render :edit }
        format.json { render json: @totalconfig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /totalconfigs/1
  # DELETE /totalconfigs/1.json
  def destroy
    @totalconfig.destroy
    respond_to do |format|
      format.html { redirect_to totalconfigs_url, notice: 'Totalconfig was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_totalconfig
      @totalconfig = Totalconfig.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def totalconfig_params
      params.require(:totalconfig).permit(:title_setting_trunk, :title_app, :template_channel)
    end
end

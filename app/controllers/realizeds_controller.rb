class RealizedsController < ApplicationController
  before_action :set_realized, only: %i[ show edit update destroy ]

  # GET /realizeds or /realizeds.json
  def index
    @realizeds = Realized.all

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @realizeds.to_csv, filename: "Realized-#{Date.today}.csv" }
    end
  end

  # GET /realizeds/1 or /realizeds/1.json
  def show
  end

  # GET /realizeds/new
  def new
    @realized = Realized.new
  end

  # GET /realizeds/1/edit
  def edit
  end

  # POST /realizeds or /realizeds.json
  def create
    @realized = Realized.new(realized_params)

    respond_to do |format|
      if @realized.save
        format.html { redirect_to realized_url(@realized), notice: "Realized was successfully created." }
        format.json { render :show, status: :created, location: @realized }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @realized.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /realizeds/1 or /realizeds/1.json
  def update
    respond_to do |format|
      if @realized.update(realized_params)
        format.html { redirect_to realized_url(@realized), notice: "Realized was successfully updated." }
        format.json { render :show, status: :ok, location: @realized }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @realized.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /realizeds/1 or /realizeds/1.json
  def destroy
    @realized.destroy

    respond_to do |format|
      format.html { redirect_to realizeds_url, notice: "Realized was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    Realized.my_import(params[:file])
    redirect_to realizeds_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realized
      @realized = Realized.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def realized_params
      params.require(:realized).permit(:stock, :symbol, :acquired, :sold, :proceeds, :cost, :extra_s, :extra_d, :extra_b, :extra_i, :extra_de)
    end
end

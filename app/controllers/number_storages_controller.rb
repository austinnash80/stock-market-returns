class NumberStoragesController < ApplicationController
  before_action :set_number_storage, only: %i[ show edit update destroy ]

  # GET /number_storages or /number_storages.json
  def index
    @number_storages = NumberStorage.all
  end

  # GET /number_storages/1 or /number_storages/1.json
  def show
  end

  # GET /number_storages/new
  def new
    @number_storage = NumberStorage.new
  end

  # GET /number_storages/1/edit
  def edit
  end

  # POST /number_storages or /number_storages.json
  def create
    @number_storage = NumberStorage.new(number_storage_params)

    respond_to do |format|
      if @number_storage.save
        format.html { redirect_to number_storage_url(@number_storage), notice: "Number storage was successfully created." }
        format.json { render :show, status: :created, location: @number_storage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @number_storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /number_storages/1 or /number_storages/1.json
  def update
    respond_to do |format|
      if @number_storage.update(number_storage_params)
        format.html { redirect_to number_storage_url(@number_storage), notice: "Number storage was successfully updated." }
        format.json { render :show, status: :ok, location: @number_storage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @number_storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /number_storages/1 or /number_storages/1.json
  def destroy
    @number_storage.destroy

    respond_to do |format|
      format.html { redirect_to number_storages_url, notice: "Number storage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number_storage
      @number_storage = NumberStorage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def number_storage_params
      params.require(:number_storage).permit(:number_storage_one, :number_storage_two, :number_storage_three, :number_storage_four, :number_storage_five)
    end
end

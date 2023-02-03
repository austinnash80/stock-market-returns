class StocksController < ApplicationController
  before_action :set_stock, only: %i[ show edit update destroy ]

  # GET /stocks or /stocks.json
  def index
    @stocks = Stock.all

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @stocks.to_csv, filename: "Stocks-#{Date.today}.csv" }
    end

    if params['update'].present?
      #if realized > ID storage then run update - add to stock (last_purchase, proceeds, ) or create new stock
      number_storage_one = NumberStorage.where(id: 1).pluck(:number_storage_one).join.to_i
      Realized.order(:id).where('id > ?', number_storage_one).all.each do |i|
        Stock.create(stock: i.stock, symbol: i.symbol, first_sale: i.sold, sales: 0, proceeds: 0, cost: 0).save
        stock_sales = Stock.where(symbol: i.symbol).pluck(:sales).join.to_i
        stock_proceeds = Stock.where(symbol: i.symbol).pluck(:proceeds).join.to_f
        stock_cost = Stock.where(symbol: i.symbol).pluck(:cost).join.to_f
        Stock.where(symbol: i.symbol).update_all last_sale: i.sold, sales: (1 + stock_sales), proceeds: (i.proceeds + stock_proceeds), cost: (i.cost + stock_cost)
        NumberStorage.where(id: 1).update_all number_storage_one: i.id
      end
      Stock.all.each do |i|
        Stock.where(id: i.id).update_all return: (i.proceeds - i.cost)
      end



      #update NumberStorage
      redirect_to stocks_path()
    end
  end

  # GET /stocks/1 or /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks or /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to stock_url(@stock), notice: "Stock was successfully created." }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1 or /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to stock_url(@stock), notice: "Stock was successfully updated." }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1 or /stocks/1.json
  def destroy
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to stocks_url, notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import #Uploading CSV function
    Stock.my_import(params[:file])
    redirect_to stocks_path, notice: "Upload Complete"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.require(:stock).permit(:stock, :symbol, :first_sale, :last_sale, :sales, :proceeds, :cost, :return)
    end
end

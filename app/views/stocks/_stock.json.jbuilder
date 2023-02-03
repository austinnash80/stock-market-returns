json.extract! stock, :id, :stock, :symbol, :first_sale, :last_sale, :sales, :proceeds, :cost, :return, :created_at, :updated_at
json.url stock_url(stock, format: :json)

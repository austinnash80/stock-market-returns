class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :stock
      t.string :symbol
      t.date :first_sale
      t.date :last_sale
      t.integer :sales
      t.decimal :proceeds
      t.decimal :cost
      t.decimal :return

      t.timestamps
    end
  end
end

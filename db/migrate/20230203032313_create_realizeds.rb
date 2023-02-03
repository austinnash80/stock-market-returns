class CreateRealizeds < ActiveRecord::Migration[6.1]
  def change
    create_table :realizeds do |t|
      t.string :stock
      t.string :symbol
      t.date :acquired
      t.date :sold
      t.decimal :proceeds
      t.decimal :cost
      t.string :extra_s
      t.date :extra_d
      t.boolean :extra_b
      t.integer :extra_i
      t.decimal :extra_de

      t.timestamps
    end
  end
end

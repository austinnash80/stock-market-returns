class CreateNumberStorages < ActiveRecord::Migration[6.1]
  def change
    create_table :number_storages do |t|
      t.integer :number_storage_one
      t.integer :number_storage_two
      t.integer :number_storage_three
      t.integer :number_storage_four
      t.integer :number_storage_five

      t.timestamps
    end
  end
end

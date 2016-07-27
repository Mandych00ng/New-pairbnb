class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.integer :reservation_id
    	t.integer :transaction_id
      t.timestamps null: false
    end
  end
end

class CreatePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_orders do |t|
      t.references :coin, foreign_key: true
      t.decimal :quantity
      t.decimal :pricePaid

      t.timestamps
    end
  end
end

class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :symbol
      t.string :coinName
      t.decimal :price

      t.timestamps
    end
  end
end

class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :purchase_price
      t.date :purchase_date
      t.integer :property_taxes
      t.integer :building_age
      t.integer :units
      t.string :city
      t.text :description
      t.references :renter, null: false, foreign_key: { to_table: :users }
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end

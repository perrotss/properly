class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.integer :unit
      t.date :renewal_date
      t.string :payment_method
      t.integer :rent_amount_cents
      t.integer :payment_date
      t.float :square_meters
      t.float :bathrooms
      t.float :bedrooms
      t.references :owner, foreign_key: { to_table: :users }
      t.references :renter, foreign_key: { to_table: :users }
      t.references :property, null: false, foreign_key: true
      t.timestamps
    end
  end
end

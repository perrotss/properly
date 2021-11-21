class AddPropertyAgeToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :property_age, :integer
  end
end

class Unit < ApplicationRecord
  belongs_to :property
  has_many :rent_payments, dependent: :destroy
  belongs_to :renter
  belongs_to :owner
  has_many_attached :photos
  monetize :rent_amount_cents

  validates :unit, :purchase_price, :rent_amount_cents, presence: true

  def self.calculate_income(property)
    units = property.units
    all_income_of_property = []
    units.each do |unit|
      income = Unit.where(property: property).sum { |unit| unit.rent_amount }
      all_income_of_property << income
    end
    all_income_of_property.first.to_f
  end
end

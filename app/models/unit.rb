class Unit < ApplicationRecord
  belongs_to :owner
  belongs_to :renter
  has_many_attached :photos

  validates :unit, :purchase_price, :rent_amount_cents, presence: true
end

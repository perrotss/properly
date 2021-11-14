class Property < ApplicationRecord
  belongs_to :owner
  has_many :units, dependent: :destroy

  validates :address, :purchase_price, :purchase_date, :units, presence: true
end

class Unit < ApplicationRecord
  belongs_to :owner
  belongs_to :renter
end

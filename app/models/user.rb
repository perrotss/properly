class User < ApplicationRecord
  has_many :buildings
  has_many :units
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  enum role: {
  owner: 0,
  renter: 1
  }
end

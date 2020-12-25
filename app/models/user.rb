class User < ApplicationRecord
  validates :name, length: { in: 4..20 }, presence: true, uniqueness: true
  validates :email, length: { in: 4..30 }, presence: true, uniqueness: true
  validates :password, length: { in: 2..20 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :links
  has_many :comments
end

# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, length: { in: 4..20 }, presence: true, uniqueness: true
  validates :email, length: { in: 4..30 }, presence: true, uniqueness: true
  validates :password, length: { in: 2..20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :links
  has_many :comments
end

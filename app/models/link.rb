# frozen_string_literal: true

class Link < ApplicationRecord
  validates :title, presence: true, length: { in: 4..255 }
  validates :url, presence: true, length: { in: 4..255 }
  validates :comments, presence: true, length: { in: 4..255 }

  acts_as_votable
  
  belongs_to :user
  has_many :comments
end

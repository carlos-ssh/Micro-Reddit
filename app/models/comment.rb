class Comment < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :url, presence: true, length: { maximum: 255 }

  belongs_to :user
  belongs_to :link
end

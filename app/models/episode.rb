class Episode < ApplicationRecord
  has_many :quotes, dependent: :destroy
  has_many :characters, through: :quotes
  has_many :appearances

  validates :title, presence: true
  validates :season, presence: true
end

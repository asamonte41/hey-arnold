class Episode < ApplicationRecord
  has_many :appearances, dependent: :destroy
  has_many :characters, through: :appearances

  validates :title, presence: true
  validates :season, numericality: { greater_than: 0 }
end

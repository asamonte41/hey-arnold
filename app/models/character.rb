class Character < ApplicationRecord
  belongs_to :location, optional: true
  has_many :appearances, dependent: :destroy
  has_many :episodes, through: :appearances

  validates :name, presence: true
  validates :role, presence: true
end

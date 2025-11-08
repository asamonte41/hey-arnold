class Character < ApplicationRecord
  belongs_to :location
  has_many :appearances
  has_many :quotes, dependent: :destroy
  has_many :episodes, through: :quotes

  validates :name, presence: true
  validates :role, presence: true

  # Optional: fallback for missing image
  def image_path
    if image_url.present?
      image_url.start_with?("http") ? image_url : "characters/#{image_url}"
    else
      "placeholder.png"
    end
  end
end

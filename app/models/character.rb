class Character < ApplicationRecord
  belongs_to :location
  has_many :appearances
  has_many :quotes, dependent: :destroy
  has_many :episodes, through: :quotes

  validates :name, presence: true
  validates :role, presence: true
  validates :description, presence: true
  validates :image_url, presence: true

  # Returns the correct image path for the character, handling png/jpg or fallback
  def image_path
    return "placeholder.png" unless image_url.present?

    base_name = image_url.sub(/\.(png|jpg)$/, "") # remove extension if present

    # Check assets for png or jpg
    if Rails.application.assets.find_asset("characters/#{base_name}.png")
      "characters/#{base_name}.png"
    elsif Rails.application.assets.find_asset("characters/#{base_name}.jpg")
      "characters/#{base_name}.jpg"
    else
      "placeholder.png"
    end
  end
end

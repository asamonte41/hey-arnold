class Character < ApplicationRecord
  belongs_to :location
  has_many :appearances, dependent: :destroy
  has_many :quotes, dependent: :destroy

  # Episodes via appearances
  has_many :appeared_episodes, through: :appearances, source: :episode

  # Episodes via quotes (optional, if you want quotes separately)
  has_many :quoted_episodes, through: :quotes, source: :episode

  validates :name, presence: true
  validates :role, presence: true
  validates :description, presence: true
  validates :image_url, presence: true

  def image_path
    if image_url.present?
      image_url.start_with?("http") ? image_url : "characters/#{image_url}"
    else
      "placeholder.png"
    end
  end
end

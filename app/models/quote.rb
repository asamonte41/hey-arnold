class Quote < ApplicationRecord
  belongs_to :character
  belongs_to :episodes
end

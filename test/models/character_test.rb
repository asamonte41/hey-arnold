require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  test "character is valid with required fields" do
  character = characters(:one)
  puts character.errors.full_messages
  assert character.valid?
end
end

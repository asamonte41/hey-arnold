require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  test "character is valid with required fields" do
    c = Character.new(name: "Arnold", role: "Student", description: "Kind boy")
    assert c.valid?
  end
end

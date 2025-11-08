require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  # Test the About page
  test "should get about" do
    get about_url  # use the correct route helper
    assert_response :success
    assert_select "h1", "About Hey Arnold!"  # checks that your <h1> text exists
  end

  # Example: you can add more page tests if you create more pages
  # test "should get home" do
  #   get root_url
  #   assert_response :success
  # end
end

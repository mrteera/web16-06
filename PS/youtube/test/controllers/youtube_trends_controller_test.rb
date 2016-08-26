require 'test_helper'

class YoutubeTrendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get youtube_trends_index_url
    assert_response :success
  end

  test "get video_list should return the list of titles" do
    # TODO
    # expected = []
    # two = Two.new
    # actual = two.one_plus_one
    # assert_equal(expected, actual)
  end
end



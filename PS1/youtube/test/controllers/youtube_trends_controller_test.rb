require 'test_helper'

class YoutubeTrendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get youtube_trends_index_url
    assert_response :success
  end

end

require 'test_helper'
require 'webmock/minitest'

# `TestTopTenYouTube` ensures top ten trending videos extraction correctness
# using real HTML data as `youtube_top_ten_trending.html` file.
class YoutubeTrendsControllerTest < ActionDispatch::IntegrationTest
  def setup
    html = File.join(Rails.root, 'test/controllers/test_data/youtube_top_ten_trending.html')
    @stub = stub_request(:get, 'https://www.youtube.com/feed/trending')
            .to_return(
              body: File.read(html)
            )
    @top_ten_videos = YoutubeTrendsController.new
  end

  def _test_data(filename)
    filename = 'test/controllers/test_data/' + filename
    JSON.parse(File.read(File.join(Rails.root, filename)))
  end

  def test_youtube_trending_should_open_youtube_trending_page
    @top_ten_videos.youtube_trending
    assert_requested(@stub)
  end

  def test_thumbnail_urls_should_return_list_of_thumbnail_urls
    actual = @top_ten_videos.thumbnail_urls
    expected = _test_data('thumbnail_urls.json')
    assert_equal(expected, actual)
  end

  def test_titles_should_return_list_of_titles
    actual = @top_ten_videos.titles
    expected = _test_data('titles.json')
    assert_equal(expected, actual)
  end

  def test_video_urls_should_return_list_of_video_urls
    actual = @top_ten_videos.video_urls
    expected = _test_data('video_urls.json')
    assert_equal(expected, actual)
  end

  def test_top_ten_youtube_should_return_list_of_titles_thumbnails_and_links
    expected = _test_data('top_ten_videos.json')
    actual = @top_ten_videos.top_ten_youtube
    assert_equal(expected, actual)
  end

  def test_divided_by_zero_should_raise_zero_division_error
    assert_raises(ZeroDivisionError) { @top_ten_videos.divide_by_zero }
  end

  test 'should get index' do
    get youtube_trends_index_url
    assert_response :success
  end
end

# `TopTenYouTube` provides access to top ten youtube video list
# from top ten trending videos on YouTube.
class YoutubeTrendsController < ApplicationController
  def index
    @top_ten_videos = top_ten_youtube
  end

  def youtube_trending
    Nokogiri::HTML(
      open('https://www.youtube.com/feed/trending'),
      nil,
      'UTF-8'
    )
  end

  def thumbnail_urls
    thumbnails = youtube_trending.css(
      '.expanded-shelf-content-item-wrapper .yt-thumb span img'
    ).to_s
    URI.extract(thumbnails).delete_if do |url|
      url.split(//).last(4).join == '.gif'
    end
  end

  def titles
    youtube_trending.css('a.yt-uix-tile-link').map { |link| link['title'] }
  end

  def video_urls
    youtube_trending.css('a.yt-uix-tile-link')
                    .map { |link| 'https://www.youtube.com' + link['href'] }
  end

  def top_ten_youtube
    titles.zip(thumbnail_urls, video_urls).first(10)
  end

  def divided_by_zero
    logger.error 'About to divide by zero'
    1 / 0
  end
end

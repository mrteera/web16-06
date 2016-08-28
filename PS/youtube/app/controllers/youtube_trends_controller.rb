# TODO
class YoutubeTrendsController < ApplicationController
  def index
    @top_ten_youtube = top_ten_youtube
  end

  def youtube_trending
    Nokogiri::HTML(open('https://www.youtube.com/feed/trending'), nil, 'UTF-8')
  end

  def thumbnail_urls
    img_elements = youtube_trending.css('.expanded-shelf-content-item-wrapper .yt-thumb span img').to_s
    URI.extract(img_elements).delete_if do |url|
      url.include? '.gif'
    end
  end

  def titles
    youtube_trending.css('a.yt-uix-tile-link').map { |title| title['title'] }
  end

  def video_urls
    youtube_trending.css('a.yt-uix-tile-link').map { |url| 'https://www.youtube.com' + url['href'] }
  end

  def top_ten_youtube
    titles.zip(thumbnail_urls, video_urls).first(10)
  end

  def divide_by_zero
    logger.error 'About to divide by zero'
    1 / 0
  end
end

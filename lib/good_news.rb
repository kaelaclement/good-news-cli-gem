require "good_news/version"
require "open-uri"
require "nokogiri"
require "pry"

module GoodNews
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./good_news/cli"
require_relative "./good_news/article"
require_relative "./good_news/scraper"
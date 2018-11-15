require "good_news/version"

module GoodNews
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./good_news/cli"
require_relative "./good_news/article"
require_relative "./good_news/scraper"
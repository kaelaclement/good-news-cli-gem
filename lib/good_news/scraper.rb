class GoodNews::Scraper
  def create_articles
    front_page = Nokogiri::HTML(open("https://goodnewsnetwork.org"))
    current_articles = front_page.css("div.td-block-span6")
    current_articles.shift
    current_articles.each do |article|
        a = GoodNews::Article.new
        a.headline = article.css("a").attribute("title").value
        a.url = article.css("a").attribute("href").value
        self.set_article_text_and_author(a, a.url)
        a.date = article.css("time").text
        a.category = article.css("a.td-post-category").text
    end
  end
    
  def set_article_text_and_author(article, url)
    article_page = Nokogiri::HTML(open(url))
    article.author = article_page.css("div.td-post-author-name a").text
    article.text = article_page.css("p")
  end
end
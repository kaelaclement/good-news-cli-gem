class GoodNews::Scraper
  @front_page = Nokogiri::HTML(open("https://www.goodnewsnetwork.org/"))
  
  def create_articles
    # headline: 
    # date: 
    # category: 
  end
  
  def set_article_text_and_author(url)
    # author: 
    # text: 
    article_page = Nokogiri::HTML(open(url))
  end
end
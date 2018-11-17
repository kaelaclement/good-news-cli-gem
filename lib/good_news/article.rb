class GoodNews::Article
  attr_accessor :headline, :date, :category, :url, :author
  attr_writer :text
    
  @@all = []
    
  def initialize
    @@all << self
  end
    
  def self.all
    @@all
  end

  def text
    puts @text[0].text
    puts @text[1].text
    puts @text[2].text
  end
end
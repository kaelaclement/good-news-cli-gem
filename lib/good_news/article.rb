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
    @text.each {|p| puts p.text}
  end
end
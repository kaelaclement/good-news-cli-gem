class GoodNews::Article
  attr_accessor :headline, :date, :category, :url, :author, :text
    
  @@all = []
    
  def initialize
    @@all << self
  end
    
  def self.all
    @@all
  end
end
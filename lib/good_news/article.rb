class GoodNews::Article
  attr_accessor :headline, :date, :category, :text, :author
  
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end
end
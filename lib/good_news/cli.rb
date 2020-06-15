class GoodNews::CLI
  
	def call
		puts "Welcome to the good news!"
		puts "Getting today's headlines..."
		puts ""
    	list_headlines
    	prompt_user
	end

	def list_headlines
	  GoodNews::Scraper.create_articles
		GoodNews::Article.all.each_with_index {|article, index| puts "#{index + 1}. #{article.headline}"}
		puts ""
	end

  def prompt_user
		puts "Enter the number of the article you would like to read, or type exit to quit."
		input = gets.strip.downcase
		if input == "exit"
			goodbye
		elsif input.to_i <= GoodNews::Article.all.length && input.to_i > 0
			GoodNews::Scraper.set_article_text_and_author(GoodNews::Article.all[input.to_i - 1]) if !GoodNews::Article.all[input.to_i - 1].author
      display_article(input.to_i - 1)
			prompt_user
		else
			puts "I don't understand, please try again."
			prompt_user
		end
	end
	
	def display_article(index)
	  article = GoodNews::Article.all[index]
		puts ""
		puts "#{article.headline}"
		puts ""
		puts "By #{article.author} on #{article.date} in #{article.category}"
		puts ""
		article.text.each {|p| puts p}
		puts ""
		puts "You can read the rest of this article in your browser at: #{article.url}"
		puts ""
	end
	  
	def goodbye
	  puts ""
		puts "Thank you for reading! Have a good day!"
	end
    
end
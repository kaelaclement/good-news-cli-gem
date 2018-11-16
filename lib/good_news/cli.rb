class GoodNews::CLI
  
	def call
		puts "Welcome to the good news!"
		puts "Getting today's headlines..."
		puts ""
		GoodNews::Scraper.new.create_articles
    	list_headlines
    	prompt_user
	end

	def list_headlines
		GoodNews::Article.all.each_with_index {|article, index| puts "#{index + 1}. #{article.headline}"}
	end

  	def prompt_user
		puts "Enter the number of the article you would like to read, or type exit to quit."
		input = gets.strip
		if input == "exit"
			goodbye
		elsif input.to_i <= GoodNews::Article.all.length && input.to_i > 0
			article = GoodNews::Article.all[input.to_i - 1]
			puts ""
			puts "#{article.headline}"
			puts ""
			puts "By #{article.author} on #{article.date} in #{article.category}"
			puts ""
			article.text
			puts ""
			puts "You can read this article in your browser at: #{article.url}"
			puts ""
			prompt_user
		else
			puts "I don't understand, please try again."
			prompt_user
		end
	end
	  
	def goodbye
	  puts ""
		puts "Thank you for reading! Have a good day!"
	end
    
end
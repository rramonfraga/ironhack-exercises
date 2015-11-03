require 'date'
require 'colorize'

class Blog
	def initialize
		@posts = []
		@page_index = 0
		@pager = 3
	end

	def add_post(post)
		@posts << post
	end

	def create_front_page
		@posts.sort { |post, post_new| post_new.date <=> post.date }
	end

	def publish_front_page(option="ini")		
		set_page_number(option)
		avoid_overflow

		system "clear"
		current = create_front_page.each_slice(@pager).to_a[@page_index]
		current.map { |post| post.show_post }
		print_pager
	end

	def set_page_number option
		case option
			when "ini"
				@page_index = 0
			when "next"
				@page_index += 1
			when "prev"
				@page_index -= 1
		end
	end

	def avoid_overflow
		max_page = @posts.each_slice(@pager).to_a.size

		if(@page_index == max_page)
			@page_index -= 1
		elsif(@page_index < 0)
			@page_index = 0
		end
	end

	def print_pager
		index_end = @posts.each_slice(@pager).to_a
		puts ""
		(1..index_end.size).each do | page | 
			if page == (@page_index + 1)
				print " " + page.to_s.red + " "
			else
				print " " + page.to_s + " "
			end
		end
		puts "\n\n"
	end
end

class Post
	attr_reader :date

	def initialize(title, date, text, sponsored=false)
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end

	def show_post
		post_title = @sponsored ? "******#{@title}******" : "#{@title}"
		puts post_title + "\n**************\n#{@text}\n----------------"
	end
end

blog = Blog.new
blog.add_post(Post.new("Post title 1", Date.new(2012, 4, 21), "Post 1 text"))
blog.add_post(Post.new("Post title 2", Date.new(2014, 5, 16), "Post 2 text", true))
blog.add_post(Post.new("Post title 3", Date.new(2015, 7, 19), "Post 3 text"))
blog.add_post(Post.new("Post title 4", Date.new(2012, 8, 19), "Post 4 text"))
blog.add_post(Post.new("Post title 5", Date.new(2014, 1, 03), "Post 5 text", true))
blog.add_post(Post.new("Post title 6", Date.new(2015, 7, 02), "Post 6 text"))
blog.add_post(Post.new("Post title 7", Date.new(2012, 8, 27), "Post 7 text"))
blog.add_post(Post.new("Post title 8", Date.new(2014, 4, 27), "Post 8 text", true))

option = "ini"
while(option != "exit")
	blog.publish_front_page(option)
	option = gets.chomp
end

require 'colorize'

class User
  def initialize count_words
    @valid_user = "Lluis"
    @valid_password = "blabla"
    @count_words = count_words
  end

  def login
    print "Introduce your username: "
    @username = gets.chomp

    print "Introduce your password: "
    @password = gets.chomp

    check_login
  end

  def check_login
    if valid_user?
      login_ok 
      @count_words.start
    else
      login_ko
    end
  end

  def valid_user?
    @valid_user == @username && @valid_password == @password
  end

  def login_ok
    puts "Loggin succeded".green
  end

  def login_ko
    puts "Loggin failed".red
  end
end

class CountWords
  def start
    count_words ask_text
  end

  def ask_text
    print "Enter a text: "
    gets.chomp
  end

  def count_words text
    puts "The text you have introduced has #{text.split.size} words."
  end
end

counter = CountWords.new
user = User.new counter
user.login
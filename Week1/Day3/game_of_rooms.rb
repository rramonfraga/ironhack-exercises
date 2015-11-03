require 'pry'

class Player
  attr_accessor :name, :position

  def initialize
      @name = ""
      @position = [3,1]
  end

  def move_north
    @position[0] -= 1
  end

  def move_south
    @position[0] += 1
  end

  def move_east
    @position[1] += 1
  end

  def move_west
    @position[1] -= 1
  end
end

class Room
  attr_accessor :position, :description

  def initialize position, description
    @position = position
    @description = description
  end
end

class Game
  def initialize
    @rooms = []
    @player = Player.new

    generate_rooms
    welcome_message
    get_user_name
  end

  def generate_rooms
    @rooms << Room.new([0,0], "You are in the room 0,0")
    @rooms << Room.new([0,1], "You are in the room 0,1")
    @rooms << Room.new([0,2], "You are in the room 0,2")
    @rooms << Room.new([1,0], "You are in the room 1,0")
    @rooms << Room.new([1,2], "You are in the room 1,2")
    @rooms << Room.new([2,0], "You are in the room 2,0")
    @rooms << Room.new([2,1], "You are in the room 2,1")
    @rooms << Room.new([2,2], "You are in the room 2,2")
    @rooms << Room.new([3,1], "You are in the main room of the library. You have a door in front of you (n).")
  end

  def welcome_message
    puts "Welcome to the Game of Rooms!!"
  end

  def get_user_name
    puts "Please, insert your name:"
    print "> "
    @player.name = gets.chomp
    load_main_game
  end

  def load_main_game
    puts "Hello #{@player.name}, have you ever played Slenderman?"
    puts "There is an old library in your city that was burned two years ago. The same day, 14 children disappear inside it."
    puts "You, as a detective, have to go accross the library and try to collect clues to find out what happened that fateful day."
    puts "But be careful! It is said that the day the incident happened, some weird figure was seen. Maybe it's still there..."
    wait_instructions
  end

  def get_current_room
    @rooms.each do |room|
      if(room.position == @player.position)
        puts room.description
      end
    end
  end

  def wait_instructions
    action = ""
    while(action != "exit")
      print_instructions
      action = gets.chomp
      move_player action
      if(!correct_room?)
        set_previous_room action
        show_wrong_way_message
      end
    end
  end

  def print_instructions
    get_current_room
    puts "What do you want to do?"
    print "> "
  end

  def move_player action
    case action
      when "n"
        @player.move_north
      when "s"
        @player.move_south
      when "e"
        @player.move_east
      when "w"
        @player.move_west
    end
  end

  def correct_room?
    @rooms.each do |room|
      if(room.position == @player.position)
        return true
      end
    end

    return false
  end

  def set_previous_room action
    case action
      when "n"
        @player.move_south
      when "s"
        @player.move_north
      when "e"
        @player.move_west
      when "w"
        @player.move_east
      end
  end

  def show_wrong_way_message
    puts "You can't follow this path. Please, choose another direction"
  end
end

game = Game.new
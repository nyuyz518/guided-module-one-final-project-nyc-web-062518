# require_relative '../config/environment.rb'
# require_relative "../app/park.rb"

require_relative './config/environment.rb'

class Runner


  def tree_art
    puts "               ,@@@@@@@,"
    puts "       ,,,.   ,@@@@@@/@@,  .oo88888o."
    puts "    ,&%%&%&&%,@@@@@/@@@@@@,8888\\88/88o"
    puts "    ,&%%&%&&%,@@@@@/@@@@@@,8888\\88/888o"
    puts "   ,%&\\%&&%&&%,@@@\\@@@/@@@ 88\\88888/888'"
    puts "   %&&%&%&/%&&%@@\@@/ /@@@ 88888\\8888888'"
    puts "   %&&%/ %&%%&&@@\\ V /@@'  `88\\8 `/888'"
    puts "   `&%\\ ` /%&'     |.|       \\ '|8'"
    puts "       |o|         | |         | |"
    puts "       |.|         | |         | |"
    puts "    \\\\/ ._\\//__/__/  ,\\_//__\\\\/.  \\_//__/_"

  end

  def greet_user
    puts "=================================================="
    puts "Hello! Welcome to the US National Parks Database!"
  end

  def list_options
    puts "=================================================="
    puts "Please select from one of the options below:"
    puts "1. Find a park by name"
    puts "2. Find all parks by state"
    puts "3. List all of the parks (there are 497 of them!)"
    puts "Type 'leave' to leave the application"
  end

  def list_options_for_park
    puts "=================================================="
    puts "What would you like to know about this park?"
    puts "1. Park description"
    puts "2. States(s) that the park is in"
    puts "3. Directions information"
    puts "4. Directions on the web"
    puts "5. Park weather"
    puts "6. Latitude and Longitude"
    puts "7. Park designation"
    puts "8. Visit the park on the web"
    puts "9. Return to previous menu"
  end

  def find_park_by_name(name)
    Park.all.find {|park| park.full_name.downcase.include?(name.downcase)}
  end

  def find_parks_by_state(state)
    parks_by_state = Park.all.select {|park| park.states.downcase.include?(state.downcase)}
    parks_by_state.each {|park| puts park.full_name}
  end

  def find_all_parks
    Park.all.each {|park| puts park.full_name}
  end

  def get_park_description(park)
    park.description
  end

  def get_states_park_is_in(park)
    park.states
  end

  def get_directions_information(park)
    park.directions_info
  end

  def get_directions_on_the_web(park)
    park.directions_url
  end

  def get_park_weather(park)
    park.weather_info
  end

  def get_lat_and_long(park)
    park.latitude_longitude
  end

  def get_park_designation(park)
    park.designation
  end

  def get_park_website(park)
    park.url
  end

  def prompt_user_main_menu
    prompt = TTY::Prompt.new
    choices = ["1. Find a park by name", "2. Find all parks by state", "3. List all of the parks (there are 497 of them!)", "4. Exit the application"]
    user_input = prompt.select("Please select from one of the options below:", choices)
    user_input = user_input.split(".")[0]
  end

  def prompt_user_park_info
    prompt = TTY::Prompt.new
    choices = ["1. Park description", "2. States(s) that the park is in", "3. Directions information", "4. Directions on the web", "5. Park weather", "6. Latitude and Longitude", "7. Park designation", "8. Visit the park on the web", "9. Return to previous menu"]
    user_input = prompt.select("What would you like to know about this park?", choices)
    user_input = user_input.split(".")[0]
  end


  def park_info_options_navigator(park)
    # user_input = gets.strip
    user_input = prompt_user_park_info
    until user_input == "9"
      if user_input == "1"
        puts "=================================================="
        puts get_park_description(park)
        puts "=================================================="
        # list_options_for_park
        # user_input = gets.strip
        user_input = prompt_user_park_info
      elsif user_input == "2"
        puts "=================================================="
        puts "#{park.full_name} is in the following state(s): #{get_states_park_is_in(park)}"
        puts "=================================================="
        # list_options_for_park
        # user_input = gets.strip
        user_input = prompt_user_park_info
      elsif user_input == "3"
        puts "=================================================="
        puts get_directions_information(park)
        puts "=================================================="
        # list_options_for_park
        # user_input = gets.strip
        user_input = prompt_user_park_info
      elsif user_input == "4"
        Launchy.open(get_directions_on_the_web(park))
        # list_options_for_park
        # user_input = gets.strip
        user_input = prompt_user_park_info
      elsif user_input == "5"
        puts "=================================================="
        puts get_park_weather(park)
        puts "=================================================="
        # list_options_for_park
        # user_input = gets.strip
        user_input = prompt_user_park_info
      elsif user_input == "6"
        puts "=================================================="
        puts get_lat_and_long(park)
        puts "=================================================="
        # list_options_for_park
        # user_input = gets.strip
        user_input = prompt_user_park_info
      elsif user_input == "7"
        if get_park_designation(park) == ""
          puts "=================================================="
          puts "I'm sorry, I do not have that information."
          puts "=================================================="
        else
          puts "=================================================="
          puts get_park_designation(park)
          puts "=================================================="
        end
        # list_options_for_park
        # user_input = gets.strip
        user_input = prompt_user_park_info
      elsif user_input == "8"
        Launchy.open(get_park_website(park))
        # list_options_for_park
        # user_input = gets.strip
        user_input = prompt_user_park_info
      # elsif user_input == "9"
        # list_options
        # user_input = gets.strip
        # main_menu
      # else
      #   puts "I'm sorry, I don't understand your request. Please try again:"
      #   user_input = ""
      #   # list_options
      #   # main_menu
      end

      # user_input
    end
    # user_input = gets.strip
    # user_input = prompt_user_main_menu
    user_input = ""
    main_menu
  end

  def main_menu
    # puts "1. Find a park by name"
    # puts "2. Find all parks by state"
    # puts "3. List all of the parks (there are 497 of them!)"
    # puts "Type 'leave' to leave the application"
    # user_input = gets.strip
    user_input = prompt_user_main_menu
    until user_input == "4"
      if user_input == "1"
        puts "Please input a park name"
        park_name = gets.strip
        park = find_park_by_name(park_name)
        puts "=================================================="
        small_mountains
        puts "=================================================="
        puts "You have selected #{park.full_name}."
        puts "=================================================="
        # list_options_for_park
        # user_input = gets.strip
        # user_input = prompt_user_park_info
        park_info_options_navigator(park)
        user_input = "4"
      elsif user_input == "2"
        puts "Please input a state's two letter code"
        state = gets.strip
        find_parks_by_state(state)
        # list_options
        # user_input = gets.strip
        user_input = prompt_user_main_menu
      elsif user_input == "3"
        find_all_parks
        # list_options
        # user_input = gets.strip
        user_input = prompt_user_main_menu
      # elsif user_input == ""
      #   # list_options
      #   # # main_menu
      #   # user_input = gets.strip
      #   user_input = prompt_user_main_menu
      # else
      #   puts "I'm sorry, I don't understand your request. Please try again:"
      #   # list_options
      #   # user_input = gets.strip
      #   user_input = prompt_user_main_menu
      end
    end
  end

  def big_mountains
  puts  "          /\\"
  puts  "         /**\\"
  puts  "        /****\\   /\\"
  puts  "       /      \\ /**\\"
  puts  "      /  /\\    /    \\        /\\    /\\  /\\      /\\            /\\/\\/\\  /\\"
  puts  "     /  /  \\  /      \\      /  \\/\\/  \\/  \\  /\\/  \\/\\  /\\  /\\/ / /  \\/  \\"
  puts  "    /  /    \\/ /\\     \\    /    \\ \\  /    \\/ /   /  \\/  \\/  \\  /    \\   \\"
  puts  "   /  /      \\/  \\/\\   \\  /      \\  /    /    \\"
  puts  "__/__/_______/___/__\____\\__________________________________________________"
  end


  def small_mountains
    puts "            o\\"
    puts "  _________/__\\_____________"
    puts ",'-..                   `- |"
    puts "(____'.       ,-.      '  ||"
    puts "  |          /\\,-\\   ,-.   |"
    puts "  |      ,-./     \\ /'.-\\  |"
    puts "  |     /-.,\\      /     \\ |"
    puts "  |    /     \\    ,-.     \\"
    puts "  |___/_______\\__/___\\_____\\"
  end


  def run
    tree_art
    greet_user
    # list_options
    main_menu
    puts "=================================================="
    puts "Thank you for using the National Parks Database!"
    puts "=================================================="
    big_mountains
  end


end

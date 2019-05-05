class Rockies::CLI
  def start
    puts "Hello Rockies fan! Here is the active pitching roster for the Colorado Rockies 2019-2020 season. "
    Rockies::Scraper.new.scrape_roster
    list_roster
    menu
  end

  def list_roster
    Rockies::Ballplayer.all.each.with_index(1) do |ballplayer, i|
      puts "#{i}. #{ballplayer.name.strip}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "If you would like to know more about one of the pitchers, enter their number."
      puts "If you'd like to see the list of pitchers again, enter 'list'."
      puts "Enter 'exit' to leave the program."
      input = gets.strip.downcase
      case input
        when "1"
          puts "More about this pitcher"
        when "2"
          puts "And more about this pitcher"
        when "list"
          list_roster
        when "exit"
          puts "Enjoy the baseball season! Go Rockies!"
        else
          puts "Whoops. That's an invalid entry. Please try again."
       end
     end
  end
end

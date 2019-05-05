class Rockies::CLI
  def start
    Rockies::Scraper.new.scrape_roster
    puts "Hello Rockies fan! Here is the active pitching roster for the Colorado Rockies 2019-2020 season. "
    list_roster
    menu
    program_exit
  end

  def list_roster
    @ballplayers = Rockies::Ballplayer
    @ballplayers.all.each.with_index(1) do |ballplayer, i|
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

      if input.to_i > 0
        ballplayer = @ballplayers[input.to_i-1]
        puts "#{ballplayer.name} wears jersey number #{ballplayer.jersey_no} and bats/throws #{ballplayer.bat_throw_position}. He is #{ballplayer.height} tall and weighs #{ballplayer.weight}. He was born on #{ballplayer.dob}."
      elsif input = "list"
        list_roster
      else
        puts "Whoops. That's an invalid entry. Please try again."
      end
     end
  end

  def program_exit
    puts "Enjoy the baseball season! Go Rockies!"
  end
end

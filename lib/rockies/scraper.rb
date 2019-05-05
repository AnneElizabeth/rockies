class Rockies::Scraper
  def scrape_roster
    html = open("http://m.mlb.com/col/roster")
    doc = Nokogiri::HTML(html)

    table = doc.at("table.roster_table")
    table.css("tbody tr").each do |ballplayer|
      name = ballplayer.css("td.dg-name_display_first_last").text
      url = ballplayer.css("a").attribute("href").value
      jersey_no = ballplayer.css("td.dg-jersey_number").text
      bat_throw_position = ballplayer.css("td.dg-bats_throws").text
      height = ballplayer.css("td.dg-height").text
      weight = ballplayer.css("td.dg-weight").text
      dob = ballplayer.css("td.dg-date_of_birth").text
      Rockies::Ballplayer.new(name, url, jersey_no, bat_throw_position, height, weight, dob)
    end
  end
end

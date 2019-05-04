class Rockies::Scraper
  def scrape_roster
    html = open("http://m.mlb.com/col/roster")
    doc = Nokogiri::HTML(html)

    table = doc.at("table.roster_table")

    table.css("tbody tr").each do |player|
      name = player.css("td.dg-name_display_first_last").text
      url = player.css("a").attribute("href").value
      jersey_no = player.css("td.dg-jersey_number").text
      bat_throw_position = player.css("td.dg-bats_throws").text
      height = player.css("td.dg-height").text
      weight = player.css("td.dg-weight").text
      height = player.css("td.dg-height").text
      dob = player.css("td.dg-date_of_birth").text
    end
  end
end

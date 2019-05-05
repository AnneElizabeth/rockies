class Rockies::Ballplayer

  attr_accessor :name, :url, :jersey_no, :bat_throw_position, :height, :weight, :dob

  @@all = []

  def initialize(name, url, jersey_no, bat_throw_position, height, weight, dob)
    @name = name.strip
    @url = url
    @jersey_no = jersey_no
    @bat_throw_position = bat_throw_position
    @height = height
    @weight = weight
    @dob = dob

    @@all << self
  end

  def self.all
    @@all
  end


end

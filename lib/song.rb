class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create(title)
    @song = title
    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
